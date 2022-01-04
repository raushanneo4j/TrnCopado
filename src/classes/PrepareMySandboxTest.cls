@isTest
class PrepareMySandboxTest {
 
    @isTest
    static void testMySandboxPrep() {
        // Insert logic here to create records of the objects that the class you’re testing
        // manipulates.
 
        Test.startTest();
 
        Test.testSandboxPostCopyScript(
            new PrepareMySandbox(), UserInfo.getOrganizationId(),
                UserInfo.getOrganizationId(), UserInfo.getOrganizationName());
 
        Test.stopTest();
 
        List<UniqueEntry__Batch_Settings__c> uebsList = new List<UniqueEntry__Batch_Settings__c>([SELECT Id FROM UniqueEntry__Batch_Settings__c LIMIT 1]);
        // Insert assert statements here to check that the records you created above have
        // the values you expect.

        //start Ringlead/Unique Entry cause List Has No Rows error in sandboxes without first inserting some settings,series
        System.assert(uebsList.size()!=0);
        //end Ringlead/Unique Entry cause List Has No Rows error in sandboxes without first inserting some settings,series
    }
}