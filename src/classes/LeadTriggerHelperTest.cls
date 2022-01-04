@isTest
public class LeadTriggerHelperTest {
    static testMethod void updateLeadTest(){
        Lead ld = new Lead();
        ld.Email = 'testemail@gmail.com';
        ld.FirstName = 'Test FirstName';
        ld.Country = 'Austria';
        test.startTest();
        insert ld;
        test.stopTest();
        Lead leadAfterInsert = [SELECT Id,LastName, FirstName, Country, Email FROM lead where Id =:ld.Id];
        System.assertEquals(leadAfterInsert.LastName, 'Unknown');
    }
}