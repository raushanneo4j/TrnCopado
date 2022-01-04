trigger Trg_LeadLinkLicenseKeyToAccount on Lead (after update) {
   //This trigger associates the license keys related to leads to converted account and contact (upon conversion)

    Map<Id, Lead> mpLeadConv = new Map<Id, Lead>();//Converted Leads
    for(Id lid : Trigger.newMap.keySet()){
        Lead lNew = Trigger.newMap.get(lid);
        Lead lOld = Trigger.oldMap.get(lid);
        if(lNew.IsConverted  != lOld.IsConverted  &&
           lNew.IsConverted )
            mpLeadConv.put(lid, lNew);
    }
    if(mpLeadConv.isEmpty())
        return;
    System.debug('mpLeadConv:' + mpLeadConv);
    List<License_Key__c> lstKeys = [SELECT Id, Lead__c 
                                      FROM License_Key__c
                                     WHERE Lead__c IN :mpLeadConv.keySet()];
    if(lstKeys.isEmpty())
        return;
    
    for(License_Key__c lkey: lstKeys){
        if(mpLeadConv.get(lkey.Lead__c) == null) continue;
        lkey.Account__c = mpLeadConv.get(lkey.Lead__c).ConvertedAccountId;
        lkey.Contact__c = mpLeadConv.get(lkey.Lead__c).ConvertedContactId;
    }
    
    UPDATE lstKeys;
}