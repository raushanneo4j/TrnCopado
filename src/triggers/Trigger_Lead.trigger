/*
Created by _ Monday Consultant
Latest Modification Date- Sep 13th 2021 By Raushan
Latest Changes - There are multiple trigger written on the Lead Object and writing multiple triggers on a single Object
is not a best practice. We decided to merge different triggers into one. We have merged "LeadReassignmentTrigger" into this trigger.
Jira Ticket - https://sfdxspt-neoj4.atlassian.net/browse/SFDCSPT-546
*/
trigger Trigger_Lead on Lead (before update, before delete, before insert, 
                                           after undelete, after update, after delete, after insert) {
    
    LeadTriggerHelper.newLeads = trigger.new;
    LeadTriggerHelper.oldLeads = trigger.old;
    LeadTriggerHelper.newMapLeads =trigger.newMap;
    LeadTriggerHelper.oldMapLeads = trigger.oldMap;
                                     
    if(!LeadTriggerHelper.runTrigger) {
        return;
    }
                                         
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            LeadTriggerHelper.updateLead();
        }
    }
}