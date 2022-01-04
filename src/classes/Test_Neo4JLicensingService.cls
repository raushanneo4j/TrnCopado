@isTest(seeAllData = TRUE)
public class Test_Neo4JLicensingService {

    static testMethod void testLicensingService()  {

    
    List<Opportunity> lstOpp = [SELECT Id, AccountId FROM Opportunity WHERE Id IN (SELECT OpportunityId FROM OpportunityContactRole) AND AccountId IN (SELECT AccountId FROM Contact) LIMIT 1];
                          
    if(lstOpp.size() > 0) {
    
    List<Contact> lstCntCt = [SELECT Id FROM Contact WHERE Email != NULL AND AccountId = :lstOpp.get(0).AccountId LIMIT 1];
   
    
    
    if(lstOpp.size() > 0 && lstCntCt.size() > 0) {
        
            ApexPages.StandardController sc = new ApexPages.StandardController(lstOpp.get(0));
            N4J_LicenseKeyRequest nlkr = new N4J_LicenseKeyRequest(sc);
            nlkr.defaultKeyRequestDetails();
            nlkr.lkey.Feature__c = 'neo4j-desktop';
            nlkr.lkey.Feature_version__c = '*';
            nlkr.lkey.Publisher__c = 'neo4j.com';
            nlkr.lkey.Quantity__c = 50;
            nlkr.lkey.Contact__c = lstCntct.get(0).Id;
            nlkr.lkey.Expiration_Date__c = Date.today().addDays(30);
            nlkr.initiateKeyRequest();
        
            sc = new ApexPages.StandardController(lstCntct.get(0));
            nlkr = new N4J_LicenseKeyRequest(sc);
            nlkr.defaultKeyRequestDetails();
            nlkr.lkey.Feature__c = 'neo4j-desktop';
            nlkr.lkey.Feature_version__c = '*';
            nlkr.lkey.Publisher__c = 'neo4j.com';
            nlkr.lkey.Quantity__c = 50;
            nlkr.lkey.Expiration_Date__c = Date.today().addDays(30);
            nlkr.initiateKeyRequest();
    }
    
    }

        
        List<Lead> lstLd = [SELECT Id, Email FROM Lead WHERE Email != NULL AND Company != NULL LIMIT 1];

    if(lstLd.size() > 0) {
        
            ApexPages.StandardController sc = new ApexPages.StandardController(lstOpp.get(0));
            N4J_LicenseKeyRequest nlkr = new N4J_LicenseKeyRequest(sc);
            sc = new ApexPages.StandardController(lstLd.get(0));
            nlkr = new N4J_LicenseKeyRequest(sc);
            nlkr.defaultKeyRequestDetails();
            nlkr.lkey.Feature__c = 'neo4j-desktop';
            nlkr.lkey.Feature_version__c = '*';
            nlkr.lkey.Publisher__c = 'neo4j.com';
            nlkr.lkey.Quantity__c = 50;
            nlkr.lkey.Expiration_Date__c = Date.today().addDays(30);
        
            nlkr.lkey.Expiration_Date__c = Date.today().addDays(-30);//date in the past to generate errors
            nlkr.initiateKeyRequest();
            nlkr.lkey.Expiration_Date__c = Date.today().addDays(30);
            nlkr.initiateKeyRequest();
            nlkr.redirectBack();
        
            //convert the lead to test Trg_LeadLinkLicenseKeyToAccount
            Database.LeadConvert lc = new database.LeadConvert();
            lc.setLeadId(lstLd.get(0).Id);

            LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
            lc.setConvertedStatus(convertStatus.MasterLabel);

            Database.LeadConvertResult lcr = Database.convertLead(lc);
    }

    
    }
}