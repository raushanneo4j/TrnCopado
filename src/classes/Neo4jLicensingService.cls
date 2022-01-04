global without sharing class Neo4jLicensingService {
       
    /*global class Auth0TokenRequest{
        public String client_secret;
        public String client_id;
        public String audience;
        public String username;
        public String password;
        public String grant_type;
        public String scope;
    }*/
    
    //represents the response from licensing API
    global class LicenseResponse{
       public string message;
    }
    public static void notifyError(String message){
         System.debug('NotifyError Message:' + message);
         Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
         Neo4J_License_Generation_Service__c cs = Neo4J_License_Generation_Service__c.getInstance();
         String[] toAddresses;
         if(cs!=null && cs.Error_Notification_Recipients__c	 != null && cs.Error_Notification_Recipients__c	 != '')
             toAddresses = cs.Error_Notification_Recipients__c	.split(',');
         else
             toAddresses = new String[]{'sukand.ravindran@infoshepherd.com'};
         mail.setToAddresses(toAddresses);
         mail.setReplyTo('noreply@salesforce.com');
         mail.setSenderDisplayName('Neo4J Licensing Service Error');
         mail.setSubject('Licensing Service Error from Org : ' + UserInfo.getOrganizationName());
         mail.setPlainTextBody(message);
         if(!Test.isRunningTest()){Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });} //we dont sendEmail during unitTests, because often test environments have Email Deliverability to System or Off (both which would crash this line without proper !Test.isRunningTest() checking.  ).  If debugging, use the Debug Statement instead.
    }
}