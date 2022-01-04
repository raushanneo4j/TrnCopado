trigger OpportunityLineItemCustomFieldHistoryTrigger on OpportunityLineItemCustomFieldHistory__c (
    before delete, before update)
{
    if(trigger.isdelete){
        for(OpportunityLineItemCustomFieldHistory__c olicfh: Trigger.old){
            olicfh.AddError('By design deletions of OpportunityLineItemCustomFieldHistory__c are prohibited');
        }
    }

    if(trigger.isupdate){
        
        for(OpportunityLineItemCustomFieldHistory__c newOLICFH : Trigger.new){  // iterates through new versions of records
            OpportunityLineItemCustomFieldHistory__c oldOLICFH = Trigger.oldMap.get(newOLICFH.Id); // get the old version of the current record
            //CORE FEATURE LOGIC
            //if(oldOLICFH.developer_note__c != newOLICFH.developer_note__c){newOLICFH.developer_note__c.addError('By trigger design updates to OpportunityLineItemCustomFieldHistory__c.developer_note__c are not allowed because it gives reasoning behind this record\'s info at time of this record\'s creation.');}
            
            //The intention is to block/prevent any update attempt from a user because this is a ledger object and should not be modified/changed/edited after creation. 
            if(trigger.isupdate && trigger.isbefore){newOLICFH.developer_note__c.addError('By design updates to OpportunityLineItemCustomFieldHistory__c are not allowed.');}
        }
    }
    
}