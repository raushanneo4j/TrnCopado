/*
Developer name- Raushan Kumar
This is a test Scenario to test the back promotion of Copado 

*/
public without sharing class LeadTriggerHelper {
    public static List<Lead> newLeads;
    public static List<Lead> oldLeads;
    public static Map<Id, Lead> newMapLeads;
    public static Map<Id, Lead> oldMapLeads;
    public static Map<Id,Lead> TestMap;
    // Above Map was only decalred to test the Copado Behaviour It doesn't serve any purpose;
    
    public static boolean runTrigger = TRUE;
    public static void updateLead(){
        for(Lead ld : newLeads){
            ld.LastName = ld.LastName == null ? 'Unknown' : ld.LastName;
            ld.Company = ld.Company == null ? 'Unknown' : ld.Company;
        }
    }
}