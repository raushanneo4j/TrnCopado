// Created: 03/2015
// Kyle Halstvedt
// Elixiter
// kyle@elixiter.com
// -----------------
@isTest
private class LeadReassignmentTest {
   /* static testMethod void testRerunAssignment() {
        // create and insert test lead
        Lead l = new Lead(FirstName='Test', LastName='Lead', Company='Testing, Inc.',Country = 'Austria',Email = 'testemail@gmail.com' );
        insert l;
        // retrieve created lead
        l = [SELECT Reassign_lead_trigger__c FROM Lead WHERE Id = :l.Id];
        // set lead reassignment trigger
        l.Reassign_lead_trigger__c = true;
        // update record, triggering reassignment after update
        update l;
        // test that trigger variable has been reset after reassignment
        l = [SELECT Reassign_lead_trigger__c FROM Lead WHERE Id = :l.Id];
        System.debug('Reassign trigger: ' + l.Reassign_lead_trigger__c);
        System.assertEquals(false, l.Reassign_lead_trigger__c);
    }
*/
}