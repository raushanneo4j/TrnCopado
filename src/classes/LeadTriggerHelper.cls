public without sharing class LeadTriggerHelper {
    public static List<Lead> newLeads;
    public static List<Lead> oldLeads;
    public static Map<Id, Lead> newMapLeads;
    public static Map<Id, Lead> oldMapLeads;
    
    public static boolean runTrigger = TRUE;
    public static void updateLead(){
        for(Lead ld : newLeads){
            ld.LastName = ld.LastName == null ? 'Unknown' : ld.LastName;
            ld.Company = ld.Company == null ? 'Unknown' : ld.Company;
        }
    }
}