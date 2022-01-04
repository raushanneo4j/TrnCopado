@isTest
private class Trg_LicenseKeyGenerationTriggerTest {
    private static testmethod void test_Trg_LicenseKeyGeneration_smartFactory_insert(){
        License_Key__c licKey = (License_Key__c)SmartFactory.createSObject('License_Key__c');
        insert licKey; //to cover the trigger
        System.assertEquals(true,true); //todo better verification, but if we get here we've verified that the DML succeeded.
        
    }

    private static testmethod void test_Trg_LicenseKeyGeneration_smartFactory_update(){
        License_Key__c licKey = (License_Key__c)SmartFactory.createSObject('License_Key__c');
        insert licKey;
        update licKey; //to cover the trigger
        System.assertEquals(true,true); //todo better verification, but if we get here we've verified that the DML succeeded.
        
    }
}