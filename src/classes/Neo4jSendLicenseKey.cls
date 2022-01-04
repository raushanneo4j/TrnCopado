public class Neo4jSendLicenseKey {
   //This method sends the email with the licensekey. It is called from the trigger on License Key object
    public void sendLicenseKeys(Map<Id, License_Key__c> oldMap, Map<Id, License_Key__c> newMap){
        Map<Id, License_Key__c> mpLicKey = new Map<Id, License_Key__c>();//License key records that need emails to be sent to customer with the key
        for(Id eid : newMap.keySet()){
            License_Key__c eNew = newMap.get(eid);
            License_Key__c eOld = oldMap.get(eid);
            if(eNew.X_Send_License_Key__c  != eOld.X_Send_License_Key__c  &&
               eNew.X_Send_License_Key__c )
                mpLicKey.put(eid, eNew);
        }
        System.debug('Neo4jSendLicenseKey mpLicKey: ' + mpLicKey);
        if(mpLicKey.isEmpty())
            return;
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
        Neo4J_License_Generation_Service__c cs = Neo4J_License_Generation_Service__c.getInstance();
        List<EmailTemplate> lstET;
        Map<Id, List<Id>> mpEntityAttachmentIds = new Map<Id, List<Id>>(); //map key records to attachments
        List<Attachment> lstAttch = [SELECT Id, ParentId FROM Attachment WHERE ParentId IN :mpLicKey.keySet() ORDER BY ParentId, CreatedDate];
        
        for(Attachment attch : lstAttch){
            /*if(mpEntityAttachmentIds.get(attch.ParentId) != null)
               mpEntityAttachmentIds.get(attch.ParentId).add(attch.Id);
            else{*/
                List<Id> lstAttchId = new List<Id>{attch.id};
                mpEntityAttachmentIds.put(attch.ParentId, lstAttchId);
           /* }*/
               
        }
        
        for(License_Key__c lkey : mpLicKey.values()){
        	Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            if(mpEntityAttachmentIds.get(lkey.Id) != null)
               message.setEntityAttachments(mpEntityAttachmentIds.get(lkey.Id));
            List<String> lstCCAddresses = new List<String>();
            lstCCAddresses.add(lKey.CreatedById);
            if(lKey.Sales_Rep_ID__c != null && lKey.Sales_Rep_ID__c != '')
                lstCCAddresses.add(lKey.Sales_Rep_ID__c);
            if(cs.Additional_Recipients_For_License_Emails__c != null)
               lstCCAddresses.addAll(cs.Additional_Recipients_For_License_Emails__c .split(','));
            message.ccaddresses = lstCCAddresses;
            /*if(lkey.Feature__c == 'neo4j-bloom-server' && lkey.Type__c == 'Trial')
                lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Trial_Email_Template_Bloom_Server__c];
            else if(lkey.Feature__c == 'neo4j-bloom-server')
                lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Email_Template_Name_Bloom_Server__c];
            else if(lkey.Type__c == 'Trial')//trial license
                lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Trial_Email_Template_Name__c];
            else
                lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Email_Template_Name__c];*/
            
            if(lkey.Feature__c == 'neo4j-bloom-server')
                lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Email_Template_Name_Bloom_Server__c];
            else if(lkey.Feature__c == 'neo4j-desktop')
                lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Email_Template_Name__c];
            else if(lkey.Feature__c == 'neo4j-bloom')
                 lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Email_Template_Name_Bloom_Desktop__c];
            else if(lkey.Feature__c == 'neo4j-gds')
                 lstET = [SELECT Id FROM EmailTemplate WHERE DeveloperName = :cs.Email_Template_Name_neo4j_gds__c];
                    
            message.setWhatId(lkey.Id);
            message.toaddresses = new List<String>{lkey.Email__c};
            Messaging.SingleEmailMessage email = Messaging.renderStoredEmailTemplate(lstET.get(0).Id, UserInfo.getUserId(), lkey.Id);
            message.setSubject(email.getSubject());
            if(email.htmlbody != null)
			    message.setHtmlBody(email.getHtmlBody()); 
            messages.add(message);
            lkey.X_Send_License_Key__c = false; //unset the flag for sending emails
        }
        
        if(!Test.isRunningTest()){ //we dont sendEmail during unitTests, because often test environments have Email Deliverability to System or Off (both which would crash this line without proper !Test.isRunningTest() checking.  ).  If debugging, use the Debug Statement instead.
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            if (results[0].success) {
                    System.debug('The email was sent successfully.');
            } else {
                System.debug('The email failed to send: '
                            + results[0].errors[0].message);
                Neo4jLicensingService.notifyError('Error while sending email to customer for Key Request ID: ' + mpLickey.keySet() + '\n\n' +
                                        'Raw Error Messages : ' + results + '\n\n'                                   
                                        );

            }
        }
        
    }
}