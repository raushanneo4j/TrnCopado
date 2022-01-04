global without sharing class BatchLicenseKeyGen implements Database.Batchable<sObject>, Database.Stateful, Database.AllowsCallouts {
    /*This batch apex job is responsible invoking neo4j licensing API to fetch the keys*/
    class LicenseKeyServiceException extends Exception {}
    Map<Id, License_Key__c> mpKeys;
    public String sessionId;
    String APIURL = ''; //URL for the Key Generation API
    String APIKEY = '';
    List<License_Key__c> lstKeys; //keys to be updated;
    List<Attachment> lstAttch; //license keys to be attached to the key request record
    
    //This method is the entry point. It is called from the trigger on License Key object
    public void getLicenseKeys(Map<Id, License_Key__c> oldMap, Map<Id, License_Key__c> newMap, String mode, String userSessionId){
        Map<Id, License_Key__c> mpLicKey = new Map<Id, License_Key__c>();//License key records that need license regeneration
        if(mode.equalsIgnoreCase('update'))
            for(Id eid : newMap.keySet()){
                License_Key__c eNew = newMap.get(eid);
                License_Key__c eOld = oldMap.get(eid);
                if(eNew.X_Generate_License_Key__c != eOld.X_Generate_License_Key__c &&
                   eNew.X_Generate_License_Key__c)
                    mpLicKey.put(eid, eNew);
            }
        else if(mode.equalsIgnoreCase('insert')){
            for(Id eid : newMap.keySet()){
                License_Key__c eNew = newMap.get(eid);
                if(eNew.X_Generate_License_Key__c)
                    mpLicKey.put(eid, eNew);
            }
        }
        System.debug('mpLicKey: ' + mpLicKey);
        if(mpLicKey.isEmpty())
            return;
        this.sessionId = userSessionId;   
        this.mpKeys = mpLicKey;
        Database.executeBatch(this, 50);
    }
    
    public void retrieveNewLicenseKey(License_Key__c keyRec, boolean reAttempt){
        HttpRequest req = new HttpRequest();  
        req.setMethod('GET');   
        req.setHeader('Content-Type', 'application/json;charset=utf-8');
        req.setHeader('x-api-key', APIKEY);    
        req.setTimeout(120000);
        Map<String,String> parameters = new Map<String,String>{
           'sub' => keyRec.Feature__c,
           'featureVersion' => keyRec.Feature_Version__c,
           'pub' => keyRec.Publisher__c,
           'reg' => keyRec.Registrant__c,
           'org' => keyRec.Organization__c,
           'email' => keyRec.Email__c,
           'scope' => keyRec.Type__c,
           'quantity' => String.valueOf(Integer.valueOf(keyRec.Quantity__c)),
           //'exp' => keyRec.Expiration_Date__c.Year() + '-' + keyRec.Expiration_Date__c.Month() + '-' + keyRec.Expiration_Date__c.Day()
           'exp' => (DateTime.newInstance(keyRec.Expiration_Date__c.Year(), keyRec.Expiration_Date__c.Month(), keyRec.Expiration_Date__c.Day()).getTime()/1000 ) + ''
        };
        PageReference p = new PageReference(APIURL);
        p.getParameters().putAll(parameters);
        req.setEndpoint(p.getUrl());
        System.debug('APIURL: ' + p.getUrl());
        HttpResponse resp;
        Http h = new Http();
        try{
            if(!Test.isRunningTest())
            	resp = h.send(req);
            else{
                resp = new HttpResponse();
                resp.setBody('{"message": "#########"}');
                if(reAttempt)
                   resp.setStatusCode(200);
                else
                   resp.setStatusCode(400);
            }
            if(resp.getStatusCode() < 200 || resp.getStatusCode() > 202)
                throw new System.CalloutException('Unexpected HTTP Status Code: ' + resp.getStatusCode());
        }catch(System.CalloutException e){
            if(!reAttempt){
                retrieveNewLicenseKey(keyRec, true);
                if(!Test.isRunningTest())
                    return;
            }
            Neo4jLicensingService.notifyError('HTTP Error while getting License Key for Key Request ID: ' + keyRec.Id + '\n\n' +
                                        'HTTP Status: ' + (resp != null ? resp.getStatusCode() : 0 ) + '-' + (resp != null ? resp.getStatus() : '') + '\n\n' +
                                        'Raw response: ' + (resp != null ? resp.getBody() : '')  + '\n\n' +
                                        'RequestURL: ' + req.getEndpoint() + '\n\n' +
                                        e.getMessage() + '\n\n' +
                                        e.getStackTraceString());
            return;
           
        }
        Neo4jLicensingService.LicenseResponse lresp;
        try{
            lresp = (Neo4jLicensingService.LicenseResponse)
                                                    JSON.deserialize(resp.getBody(), Neo4jLicensingService.LicenseResponse.class);
            if(lresp == null || lresp.message == null)
                throw new LicenseKeyServiceException('Unable to parse JSON from Licensing Service');
        }catch(Exception e){
            Neo4jLicensingService.notifyError('JSON Error while parsing License Key response for Request ID: ' + keyRec.Id + '\n\n' +
                                       'Raw JSON response: ' + resp.getBody() + '\n\n' +
                                       'RequestUL: ' + req.getEndpoint() + '\n\n' +
                                       e.getMessage() + '\n\n' +
                                       e.getStackTraceString()
                                      );
            return;
        }
        License_Key__c kRec = new License_Key__c(Id = keyRec.Id, Key__c = lresp.message, Email__c = keyRec.Email__c, X_Send_License_Key__c = true, X_Generate_License_Key__c = false, Type__c = keyRec.Type__c, Feature__c = keyRec.Feature__c);
        lstKeys.add(kRec);
        
        Attachment attch = new Attachment();
	    attch.ParentId = keyRec.Id;
	    //attch.Name = 'license_key.txt';
	    attch.Name = keyRec.Email__c + '+' + KeyRec.Feature__c + '.txt';
	    attch.Body = Blob.valueOf(lresp.message);
	    attch.ContentType = 'text/plain';
	    lstAttch.add(attch);
    }
    /*//this method gets the bearer token from Auth0
    public void getAuth0BearerToken(Neo4J_License_Generation_Service__c cs){
        HttpRequest req = new HttpRequest();  
        req.setMethod('POST');   
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);
        req.setEndpoint(cs.API_Auth_URL__c);
        
        Neo4jLicensingService.Auth0TokenRequest reqBody = new Neo4jLicensingService.Auth0TokenRequest();
        reqBody.username = cs.Auth0_UserName__c;
		reqBody.password = cs.Auth0_Password__c;
        reqBody.client_id = cs.Client_ID__c;
        reqBody.client_secret = cs.Client_Secret__c;
        reqBody.grant_type = 'password';
        if(cs.Requested_Scope__c != null && cs.Requested_Scope__c.trim() != '')
        	reqBody.scope = cs.Requested_Scope__c;
        reqBody.audience = APIURL;
        
        String jsonReq = JSON.serialize(reqBody);
        System.debug('Auth0 Toke Req:' + jsonReq);
        req.setBody(jsonReq);
        HttpResponse resp;
        Http h = new Http();
        try{
            resp = h.send(req);
            if(resp!= null)
            	System.debug('resp:' + resp.getBody());
            if(resp.getStatusCode() < 200 || resp.getStatusCode() > 202)
                throw new System.CalloutException('Unexpected HTTP Status Code: ' + resp.getStatusCode());
        }catch(System.CalloutException e){ 
           
           Neo4jLicensingService.notifyError('HTTP Error while requesting Auth0 Token: ' + '\n\n' +
                                            'HTTP Status: ' + (resp != null ? resp.getStatusCode() : 0 ) + '-' + (resp != null ? resp.getStatus() : '') + '\n\n' +
                                            'Raw JSON response: ' + (resp != null ? resp.getBody() : '')  + '\n\n' +
                                            'RequestBody: ' + jsonReq + '\n\n' +
                                            e.getMessage() + '\n\n' +
                                            e.getStackTraceString());
               
            return;
        }
       
    }*/
    global Iterable<sObject> start(Database.BatchableContext info){ 
        Neo4J_License_Generation_Service__c cs = Neo4J_License_Generation_Service__c.getInstance();
        APIURL = cs.Licensing_API_URL__c;
        APIKEY = cs.Licensing_API_Key__c;
        lstKeys = new List<License_Key__c>();
        lstAttch = new List<Attachment>();
        return mpKeys.values();
    }
    global void execute(Database.BatchableContext info, List<License_Key__c> scope){
        lstKeys.clear();
        lstAttch.clear();
        for(License_Key__c keyRec : scope){
            retrieveNewLicenseKey(keyRec, false);
        }
        if(!lstAttch.isEmpty())
            INSERT lstAttch;
        if(!lstKeys.isEmpty())
            UPDATE lstKeys; //set the key field on the license key record and trigger the email
    }
    global void finish(Database.BatchableContext info){     
    } 
}