trigger Trg_LicenseKeyGeneration on License_Key__c (after insert, after update, before update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        new BatchLicenseKeyGen().getLicenseKeys(Trigger.oldMap, Trigger.newMap, 'update', UserInfo.getSessionId());      
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        new Neo4jSendLicenseKey().sendLicenseKeys(Trigger.oldMap, Trigger.newMap); //send the key
    }
    if(Trigger.isAfter && Trigger.isInsert){
        new BatchLicenseKeyGen().getLicenseKeys(null, Trigger.newMap, 'insert', UserInfo.getSessionId());
    }
}