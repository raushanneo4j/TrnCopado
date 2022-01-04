/*
new - Returns a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
old - Returns a list of the old versions of the sObject records. This sObject list is only available in update and delete triggers.
oldMap - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.

*/
trigger Trigger_OpportunityLineItem on OpportunityLineItem ( after insert, after update, after delete, after undelete,
                                                             before insert , before update , before delete) {
    private OpportunityLineItem otype = null;                                                                         // try-catch-log pattern. This also could be DRY'd into a public run() on a generic triggerhandler, comment series //protected SObjectType otype = null;
    private List<Apex_Event_Log__c> errorList = new List<Apex_Event_Log__c>();                                     // try-catch-log pattern. This also could be DRY'd into a public run() on a generic triggerhandler, comment series
    
    try{                                                                                                                // try-catch-log pattern. This also could be DRY'd into a public run() on a generic triggerhandler, comment series
        OpportunityLineItemTriggerHelper.newOpportunityLines = trigger.new; //monday call (consultant) code
        OpportunityLineItemTriggerHelper.oldOpportunityLines = trigger.old; //monday call (consultant) code
        OpportunityLineItemTriggerHelper.newMapOpportunityLines =  trigger.newMap; //monday call (consultant) code
        OpportunityLineItemTriggerHelper.oldMapOpportunityLines = trigger.oldMap; //monday call (consultant) code
                                                                
        if( !OpportunityLineItemTriggerHelper.runTrigger ) { //monday call (consultant) code
            return; //monday call (consultant) code
        }

        if (Trigger.operationType == TriggerOperation.BEFORE_INSERT) {
            OpportunityLineItemTriggerHelper.populateProduct(); //monday call (consultant) code
            OpportunityLineItemTriggerHelper.OppLineItemBeforeInsert(trigger.new); //trigger.old not supported in insert triggers. //trigger.newMap not supported in before insert triggers. //trigger.oldMap not supported in insert triggers.
        }
        if (Trigger.operationType == TriggerOperation.BEFORE_UPDATE) {  //trigger.old only avail in update & delete
            OpportunityLineItemTriggerHelper.OppLineItemBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap); //trigger.new records can only be modified in before triggers.   
        }
        if (Trigger.operationType == TriggerOperation.AFTER_INSERT) { 
            OpportunityLineItemTriggerHelper.OppLineItemAfterInsert(trigger.new, trigger.newMap, trigger.oldMap); //trigger.old not supported in insert triggers
        }
        if (Trigger.operationType == TriggerOperation.AFTER_UPDATE) { 
            OpportunityLineItemTriggerHelper.OppLineItemAfterUpdate(trigger.new, trigger.newMap, trigger.oldMap); //trigger.old  supported in update triggers
        }
        if (Trigger.operationType == TriggerOperation.AFTER_DELETE) { 
            OpportunityLineItemTriggerHelper.OppLineItemAfterDelete(trigger.new, trigger.old, trigger.oldMap); //trigger.newMap not supported in after_delete
        }
        if (Trigger.operationType == TriggerOperation.AFTER_UNDELETE) {
            OpportunityLineItemTriggerHelper.OppLineItemAfterUndelete(trigger.new, trigger.newMap); //trigger.oldMap and trigger.old not supported in undelete
        }
    }  catch ( Exception e ) {
        log(
                String.valueOf( otype ) + ' : uncaught',
                '0',
                JSON.serialize( trigger.new ),
                e.getMessage() + '\n'
                    + e.getStackTraceString()
            );
        } finally {
            finish();
        }

    /**
     * log prepares any exception details into memory
     */
    private void log( String eventType, String eventRecordId,
        String eventMessage, String eventDetails
    ) {
        errorList.add( new Apex_Event_Log__c(
            Event_Type__c = eventType,
            Event_ID__c = eventRecordId,
            Event_Details__c = eventDetails,
            Event_Error_Message__c = eventMessage
        ) );
    }

    /**
     * finish DML inserts any exceptions
     */
    private void finish() {
        if ( !errorList.isEmpty() ) {
            Database.insert( errorList, false );
        }
    }

}