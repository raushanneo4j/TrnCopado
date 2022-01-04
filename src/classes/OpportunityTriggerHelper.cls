/* Friendly reminder about Trigger Context variables
new - Returns a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
old - Returns a list of the old versions of the sObject records. This sObject list is only available in update and delete triggers.
oldMap - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.

*/
public with sharing class OpportunityTriggerHelper{ //the Opportunity Trigger Helper
    //start If neo4j_apexBypass_context__c is ever set to true, such as in controlled scenarios like grant-based PowerEditor updates, THEN this feature block ensures those paths exit by setting it back to false so that its never true when users are editing the record, series
    Private static Map <Id,boolean> oldIsBypassedMap = null; //follows Dan Appleman's pattern for recursion control,  this helps prevent recursion thus promote data quality within the neo4j_apexBypass_context__c field, read about it in his book or in https://salesforce.stackexchange.com/a/46798 
    //end If neo4j_apexBypass_context__c is ever set to true, such as in controlled scenarios like grant-based PowerEditor updates, THEN this feature block ensures those paths exit by setting it back to false so that its never true when users are editing the record, series
   
    /**Opportunity AFTER_UNDELETE //after undelete
     * OpportunityAfterUndelete 
     * @param  newOpps represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  newMap      represents A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     */
    public static void OpportunityAfterUndelete(list<Opportunity> newOpps, map<Id,Opportunity> newMap){

            
    } 
    
    /**Opportunity AFTER_DELETE //after delete
     * OpportunityAfterDelete description
     * @param  newOpps represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  oldOpps represents trigger.old, a list of the old versions of the sObject records. This sObject list is only available in update and delete triggers.
     * @param  oldMap      oldMap description
     */
    public static void OpportunityAfterDelete(list<Opportunity> newOpps, list<Opportunity> oldOpps, map<Id,Opportunity> oldMap){

    }
    
    /**Opportunity AFTER_INSERT
     * OpportunityAfterInsert 
     * @param  newOpps represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  newMap      represents trigger.newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     * @param  oldMap      represents trigger.oldMaP - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.
     */
    public static void OpportunityAfterInsert(list<Opportunity> newOpps, map<Id,Opportunity> newMap, map<Id,Opportunity> oldMap){
        //start apex maintains neo4j_apexBypass_context__c, series
            

        //end apex maintains neo4j_apexBypass_context__c, series
    }
    /**Opportunity AFTER_UPDATE
     * OpportunityAfterUpdate
     * @param  newOpps represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  newMap      represents trigger.newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     * @param  oldMap      represents trigger.oldMaP - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.
     */
    public static void OpportunityAfterUpdate(list<Opportunity> newOpps, map<Id,Opportunity> newMap, map<Id,Opportunity> oldMap){

    }
    /**Opportunity BEFORE_INSERT //before insert //supports ARRCalc a7z3s0000004SGsAAM
     * OpportunityBeforeInsert
     * @param  newOpps represents trigger.new - a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     */
    public static void OpportunityBeforeInsert(list<Opportunity> newOpps){
        for(Opportunity oppty : newOpps) {

            
        }
    
    }
    
    /**Opportunity BEFORE_UPDATE //before update //supports ARRCalc a7z3s0000004SGsAAM
     * OpportunityBeforeUpdate
     * @param  newOpps represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  oldOpps represents trigger.old - a list of the old versions of the sObject records. This sObject list is only available in update and delete triggers.
     * @param  newMap      represents trigger.newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     * @param  oldMap      represents trigger.oldMaP - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.
     */
    public static void OpportunityBeforeUpdate(list<Opportunity> newOpps, list<Opportunity> oldOpps, map<Id,Opportunity> newMap, map<Id,Opportunity> oldMap) {
        for(Opportunity oppty : newOpps) {
            

        }
            
    }

}