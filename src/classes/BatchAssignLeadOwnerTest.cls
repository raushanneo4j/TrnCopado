//Test Class for Batch class named BatchAssignLeadOwner
@isTest
private class BatchAssignLeadOwnerTest{
    public static Lead leadObj;
    public static User userObj;
    
    private static testmethod void initiateData () {
        leadObj = new Lead( LastName = 'Test Lead',
                            Company = 'Test Company',
                            Assigned_User_ID__c = 'test',
                            FirstName = 'Test FirstName',
                            Country = 'Austria',
                            Email = 'testemail@gmail.com'
                          );
        insert leadObj;
        
        
    }
    
    static testMethod void executeAssignLeadOwnerTest(){
        //insert dummy data
        initiateData();
        
        test.startTest();
        //Creating batch Class Object for Execution of Batch
        BatchAssignLeadOwner bchObj = new BatchAssignLeadOwner();
        Database.executeBatch( bchObj );
        test.stopTest();
        
    }
}