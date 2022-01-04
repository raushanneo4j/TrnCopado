@isTest
private class Trigger_OpportunityLineItemTest {
    private static testmethod void populateProductTest01(){
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //Create your product
        Product2 prod = new Product2( Name = 'Test Type',
                                      ProductCode = 'Pro-X',
                                      isActive = true );
        insert prod;
        
        //Create your pricebook entry
        PricebookEntry pbEntry = new PricebookEntry( Pricebook2Id = pricebookId,
                                                     Product2Id = prod.Id,
                                                     UnitPrice = 100.00,
                                                     IsActive = true );
        insert pbEntry;
        
        //create your opportunity
        Opportunity opp = new Opportunity( Name = 'Test Opportunity',
                                           StageName = 'Qualification',
                                           CloseDate = System.today(),
                                           Sugar_ID__c = 'Opp' );
        insert opp;
            
        //create your opportunity line item.
        OpportunityLineItem oli = new OpportunityLineItem( Opportunity_ID__c = 'Opp',
                                                           Quantity = 1, //qty must be one (1) to satisfy a validation rule.
                                                           PricebookEntryId = pbEntry.Id,
                                                           UnitPrice = 10,
                                                           ProductType__c = 'Test Type',
                                                           Product_Type__c='New');
        test.startTest();
        insert oli;
        test.stopTest();
        
        //Opportunity Line After Update.
        OpportunityLineItem oppLineAfterUpdate = [ SELECT Id, Name, Product2Id, OpportunityId
                                                   FROM OpportunityLineItem WHERE Id = : oli.id ];
        System.assertEquals( oppLineAfterUpdate.Product2Id, prod.Id );
        System.assertEquals( oppLineAfterUpdate.OpportunityId, opp.Id );
    }
    private static testmethod void populateProductTest02(){
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //Create your product
        Product2 prod = new Product2( Name = 'Test Type',
                                      ProductCode = 'Pro-X',
                                      isActive = true );
        insert prod;
        
        //Create your pricebook entry
        PricebookEntry pbEntry = new PricebookEntry( Pricebook2Id = pricebookId,
                                                     Product2Id = prod.Id,
                                                     UnitPrice = 100.00,
                                                     IsActive = true );
        insert pbEntry;
        Opportunity opp = new Opportunity( Name = 'Test Opportunity',
                                           StageName = 'Qualification',
                                           CloseDate = System.today(),
                                           Sugar_ID__c = 'Opp' );
        insert opp;
            
        //create your opportunity line item.
        OpportunityLineItem oli = new OpportunityLineItem( OpportunityId = opp.Id,
                                                           Quantity = 1, //qty must be one (1) to satisfy a validation rule.
                                                           PricebookEntryId = pbEntry.Id,
                                                           UnitPrice = 10,
                                                           ProductType__c = 'Test Type',
                                                           Product_Type__c='New');
        OpportunityLineItemTriggerHelper.runTrigger = FALSE;
        insert oli;
    }

    //start neo4j common/standard testSetup. SFDC-0503- todo DRY the testSetup methods into a factory class<https://neo4j--organizer.na141.visual.force.com/a7z4o000000GrYbAAK>
    @testSetup static void setupPricingData() { //Use test setup methods (methods that are annotated with @testSetup) to create test records once and then access them in every test method in the test class.
        //If a test class contains a test setup method, the testing framework executes the test setup method first, before any test method in the class.
        //Records that are created in a test setup method are available to all test methods in the test class and are rolled back at the end of test class execution. 
        //If a test method changes those records, such as record field updates or record deletions, those changes are rolled back after each test method finishes execution. 
        //The next executing test method gets access to the original unmodified state of those records
        //source=https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_testsetup_using.htm
        
        SmartFactory.FillAllFields=true;
       
        //excluded Opportunity TestSetup Fields
        /** more information about this classes testsetup and its smartfactory Excluded Fields:
         * OwnerId is excluded in setupsetup because we use the testing user instead.
         * Closed_Lost_Competitor__c is excluded because validation rule msg "Closed Lost Competitor field is only used for Closed Lost opps with Loss Reason Competition"
         * Loss_Reason__c is excluded beacuse validation rule msg "Loss Reason is only used when Sales Stage is Closed Lost"
        */
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'OwnerId','Closed_Lost_Competitor__c','Loss_Reason__c'});

        Account acct = (Account)SmartFactory.createSObject('Account');
        acct.BillingCountry = 'United States'; //this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.BillingCountryCode ='US'; //this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.BillingState ='Washington'; //this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.BillingStateCode = 'WA'; //this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.ShippingCountry = 'United States'; //this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.ShippingCountryCode= 'US'; //this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.ShippingState = 'Washington'; //this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.ShippingStateCode='WA';//this intends to bypass state/country picklist validation error (There's a problem with this country, even though it may appear correct. Please select a country/territory from the list of valid countries)
        acct.Imported_from_Whitespace__c='0'; //at time of writing, its a text field,  and we set it to '0' here so that it does not enter the "Enrich Whitespace Created Accounts" flow, because that flow was failing when we had set this to 1.
        
        try{
            insert acct;
        }catch(Exception e){
            system.debug(e.getStackTraceString() + e.getCause());
        }
        

        Opportunity opp = (Opportunity)SmartFactory.createSObject('Opportunity');
        opp.AccountId = acct.Id;
        opp.Use_Case__c='Risk Management'; //because Use_Case__c & Use_Case_Sub__c may be restricted and picklist dependent
        opp.Use_Case_Sub__c='Anti Money Laundering'; //because Use_Case__c & Use_Case_Sub__c may be restricted and picklist dependent

        insert opp;
        
        // Create common test Product, Pricebook, and PbEntries.
        // First, set up test price book entries.
        // Insert a test product.
        Product2 prod = new Product2(Name = 'Test Product ARRCalc/a7z3s0000004SGsAAM', 
            Family = 'Hardware');
        insert prod;
        // Get standard price book ID.
        // This is available irrespective of the state of SeeAllData.
        Id pricebookId = Test.getStandardPricebookId();
        // 1. Insert a price book entry for the standard price book.
        // Standard price book entries require the standard price book ID we got earlier.
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        // Create a custom price book
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        // 2. Insert a price book entry with a custom price.
        PricebookEntry customPrice = new PricebookEntry(
            Pricebook2Id = customPB.Id, Product2Id = prod.Id,
            UnitPrice = 12000, IsActive = true);
        insert customPrice;
        // Next, perform some tests with your test price book entries.
    }
    //end neo4j common/standard testSetup. SFDC-0503- todo DRY the testSetup methods into a factory class<https://neo4j--organizer.na141.visual.force.com/a7z4o000000GrYbAAK>
    
    @IsTest
    static void test_arrCalc_beforeInsert_OLI_with_calcVariables(){
        
        //Given that @testSetup creates an Account, Opportunity, PricebookEntry, PricebookEntry.
        
        Test.startTest();
        
        //When we have arrCalc variables during OLI insert
        
        Test.stopTest();

        //We expect arr to be derived from those variables per business formula: 
        
    }
    
    @IsTest
    static void test_arrCalc_beforeInsert_OLI_without_calcVariables(){
        //Given that @testSetup creates an Account, Opportunity, PricebookEntry, PricebookEntry.
        
        Test.startTest();
        
        //When OLI inserts    
        
        Test.stopTest();

        //We expect ARR to remain unchanged
        
    }

    @IsTest
    static void test_arrCalc_beforeInsert_OLI_with_exception(){
        //setup
        
        //Given that @testSetup creates an Account, Opportunity, PricebookEntry, PricebookEntry.
        
        Test.startTest();
        
        //When an exception occurs during OLI insert
        
        Test.stopTest();

        //We expect arr to remain unchanged
        
    }


}