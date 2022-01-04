// Created: 03/2015
// Kyle Halstvedt
// Elixiter
// kyle@elixiter.com
// -----------------
trigger LeadReassignmentTrigger on Lead (after update) {
    // fetch leads being updated
    Lead[] updatedLeads = Trigger.new;
    Id[] leadIds = new List<Id>();
    // create list of leads where Reassign_lead_trigger__c == true
    for (Lead l : updatedLeads) {
        if (l.Reassign_lead_trigger__c != null && l.Reassign_lead_trigger__c == true) {
            leadIds.add(l.Id);
        }
    }
    // pass list of leads to reassignment function
    if(leadIds != null && leadIds.size() > 0) {
        LeadReassignmentController.rerunAssignment(leadIds);
    }
}