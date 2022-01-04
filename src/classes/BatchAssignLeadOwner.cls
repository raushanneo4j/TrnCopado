//batch Class to Assign Owner at Lead

global class BatchAssignLeadOwner implements Database.Batchable<sObject>{
    global Database.QueryLocator start( Database.BatchableContext BC ){
        String queryLeads = ' SELECT Id, Assigned_User_ID__c, Is_Processed__c' +
                            ' FROM Lead '+
                            ' WHERE Is_Processed__c = FALSE ';
                            
        return Database.getQueryLocator( queryLeads );
    }
    
    //Execution of Batch Starts here. It will take list of Shipping Address
    global void execute( Database.BatchableContext BC, List<Lead> leads ){
        Set<String> AssignedUserIds = new Set<String>();
        
        for( Lead leadObj : leads ){
            if( leadObj.Assigned_User_ID__c != Null){
                AssignedUserIds.add( leadObj.Assigned_User_ID__c );    
            }
        }
        
        Map<String, User> mapSugarIdToOwner = new Map<String, User>();
        
        for( User userObj : [SELECT id, Sugar_Id__c FROM User WHERE Sugar_Id__c IN: AssignedUserIds ] ){
            mapSugarIdToOwner.put( userObj.Sugar_Id__c, userObj );
        }
        
        List<Lead> leadToUpdate = new List<Lead>();
        
        for( Lead leadObj : leads ){
            if( (leadObj.Assigned_User_ID__c != Null) && (mapSugarIdToOwner.containsKey( leadObj.Assigned_User_ID__c )) ){
                leadObj.Ownerid = mapSugarIdToOwner.get( leadObj.Assigned_User_ID__c ).Id;
            }
            leadObj.Is_Processed__c = TRUE;
            leadToUpdate.add( leadObj );
        
        }
        //System.assert(false, leadToUpdate.size());
        Database.update( leadToUpdate, false );
    }
        
   global void finish( Database.BatchableContext BC ){

   }
}