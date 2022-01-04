// Created: 03/2015
// Kyle Halstvedt
// Elixiter
// kyle@elixiter.com
// -----------------
/*
This Class was decommissioned as we are no longer using Lead Assignment and instead Lean Data is being used
Decommission Date- Sep 20th */
public class LeadReassignmentController {
   /* // re-run assignment rules for an array of lead Id's
    public static void rerunAssignment(Id[] leadIds) {
        // fetch lead records
        Lead[] leads = new List<Lead>();
        leads = [Select Reassign_lead_trigger__c From Lead Where Id In :leadIds Limit 49999];
        // set DML options
        Database.DMLOptions dmo = new Database.DMLOptions();
        dmo.assignmentRuleHeader.useDefaultRule = true;
        if (leads != null && leads.size() > 0) {
            for (Lead l : leads) {
                // restore default false value for trigger
                l.Reassign_lead_trigger__c = false;
                // set DML options for update operation
                l.setOptions(dmo);
            }
            update leads;
        }
    }*/
}