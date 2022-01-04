global class PrepareMySandbox implements SandboxPostCopy {
    global void runApexClass(SandboxContext context) {
        System.debug('Org ID: ' + context.organizationId());
        System.debug('Sandbox ID: ' + context.sandboxId());
        System.debug('Sandbox Name: ' + context.sandboxName());
 
        try{
            
            //start Ringlead/Unique Entry cause List Has No Rows error in sandboxes without first inserting some settings,series
                RingLeadTrigger__Batch_Settings__c rltbs = new RingLeadTrigger__Batch_Settings__c(
                Name='something',
                RingLeadTrigger__Batch_Size__c=2000,
                RingLeadTrigger__Re_Evaluate_Count__c=2
                );
                
                UniqueEntry__Batch_Settings__c uebs = new UniqueEntry__Batch_Settings__c(
                Name='something',
                UniqueEntry__Batch_Size__c=2000,
                UniqueEntry__Re_Evaluate_Count__c=2
                );
                
                insert rltbs;
                insert uebs;
            //end Ringlead/Unique Entry cause List Has No Rows error in sandboxes without first inserting some settings,series

        } catch (Exception e){
        System.debug('exception: '+ e.getMessage());
        } 
        
    }
}