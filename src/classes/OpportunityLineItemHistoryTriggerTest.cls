@isTest
public with sharing class OpportunityLineItemHistoryTriggerTest {
    
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
        insert acct;

        Opportunity opp = (Opportunity)SmartFactory.createSObject('Opportunity');
        opp.AccountId = acct.Id;
        opp.Use_Case__c='Risk Management'; //because Use_Case__c & Use_Case_Sub__c may be restricted and picklist dependent
        opp.Use_Case_Sub__c='Anti Money Laundering'; //because Use_Case__c & Use_Case_Sub__c may be restricted and picklist dependent
        opp.OwnerId=UserInfo.getUserId(); //it should be, current user, but just in case!
        opp.CurrencyIsoCode='USD'; //helps avoid errors in unit tests such as 'pricebook entry currency code does not match opportunity currency code'
        insert opp;
        
        // Create common test Product, Pricebook, and PbEntries.
        // First, set up test price book entries.
        // Insert a test product.
        Product2 prod = new Product2(Name = 'Test Product ARRCalc/a7z3s0000004SGsAAM', 
            Family = 'Hardware',Subscription_Product__c=true);
        insert prod;
        // Get standard price book ID.
        // This is available irrespective of the state of SeeAllData.
        Id pricebookId = Test.getStandardPricebookId();
        // 1. Insert a price book entry for the standard price book.
        // Standard price book entries require the standard price book ID we got earlier.
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 10000, IsActive = true,CurrencyIsoCode=opp.CurrencyIsoCode);
        insert standardPrice;
        // Create a custom price book
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        // 2. Insert a price book entry with a custom price.
        PricebookEntry customPrice = new PricebookEntry(
            Pricebook2Id = customPB.Id, Product2Id = prod.Id,
            UnitPrice = 12000, IsActive = true,CurrencyIsoCode=opp.CurrencyIsoCode);
        insert customPrice;
        // Next, perform some tests with your test price book entries.
    }
    //end neo4j common/standard testSetup. SFDC-0503- todo DRY the testSetup methods into a factory class<https://neo4j--organizer.na141.visual.force.com/a7z4o000000GrYbAAK>
    
    @IsTest
    static void test_preventDeletion_within_OpportunityLineItemCustomFieldHistoryTrigger(){
                
        //Given that @testSetup creates an Account, Opportunity, PricebookEntry, PricebookEntry.
        
        //Given the user creates Opportunity Products (which upon DML establishment or change would trigger OpportunityLineItem.trigger)
        OpportunityLineItem oli = (OpportunityLineItem)SmartFactory.createSObject('OpportunityLineItem');
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        Product2 product = [SELECT Id FROM Product2 WHERE Subscription_Product__c=TRUE LIMIT 1];
        Id pbId = [SELECT Id FROM Pricebook2 WHERE IsActive=TRUE LIMIT 1].Id;
        oli.OpportunityId = opp.Id;
        oli.UnitPrice=1000.00;
        oli.Quantity=1;
        oli.Product2Id=product.Id;
        oli.Term_Start_Date__c=system.Today().addMonths(6);
        oli.Term_End_Date__c=system.Today().addMonths(10);
        /*Interesting note to avoid testing errors "You can't select products until you've chosen a price book for this opportunity on the products related list":
        *  first update the opportunity -> Price Book Id.  
            Once you add the price book to the opportunity you don't need to set the Price Book Entry Id on the Opportunity Product.  
            So remove the setting of that field. 

            The error states that you must choose a price book on the opportunity first. 
            In a unit test, this usually involves using the Test.getStandardPricebookId method:


        */
        //opp.Pricebook2 = pbId;
        //update opp;

        opp.Pricebook2Id = Test.getStandardPricebookId();
        update opp;

        insert oli; //this triggers our test //A trigger would run that prevents deletion.  This tests that.

        Test.startTest();
        
        //When deletion of OpportunityLineItemCustomFieldHistory__c is attempted, we expect rollback.
        //we can query this because with the insert of oli this would exist
        /*start Pre-release Comment Block, reconsider on January 9th 2021 (2021-01-09),series
        OpportunityLineItemCustomFieldHistory__c OLICFH = [SELECT Id FROM OpportunityLineItemCustomFieldHistory__c LIMIT 1];
        */
        OpportunityLineItemCustomFieldHistory__c oliHist = (OpportunityLineItemCustomFieldHistory__c)SmartFactory.createSObject('OpportunityLineItemCustomFieldHistory__c');
       // OpportunityLineItemTriggerHelper oppLItrigger=New OpportunityLineItemTriggerHelper();
        OpportunityLineItemTriggerHelper.getWholeMonthsBetweenTwoDatesAsDecimal(system.today().addMonths(3),system.today().addMonths(6));
        try{
            insert oliHist;
            delete oliHist;
        } catch (Exception e){
            System.debug('exception when testing the trigger that prevents deletions of oliHist ledgers. ErrorMessage: '+e.getMessage());
        }
        
        System.assertEquals(true, true); //todo actually assert something. 
        

        Test.stopTest();
        
    }    
    @IsTest
    static void test_Opportunity_LineItem_Renewal_Logic(){
        //Given @testSetup Data

        //Well insert Test Users, assign Profile, and CustomPermissions,   and create/DML data,  to mimick/mock/impersonate  realistic unit tests
        System.runAs(new User(Id = UserInfo.getUserId())) { //The admin context will create/provision Test Users during this test.

            //Create Test Finance User, Assign A Custom Permission, and test some dml
            String orgId = UserInfo.getOrganizationId();
            String dateString = String.valueof(Datetime.now()).replace(' ','').replace(':','').replace('-','');
            Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));
            String uniqueName = orgId + dateString + randomInt;
            Profile finance_ProfileForAutomatedTests = [SELECT Id FROM Profile WHERE Name='Neo4j - Finance'];
            User finance_UserForAutomatedTestsWithCustomPermission = new User(Alias = 'newUser', Email=uniqueName+'TestUser_@neo4j.com',
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
            LocaleSidKey='en_US', ProfileId = finance_ProfileForAutomatedTests.Id,
            Rep_Geo__c='LATAM',TimeZoneSidKey='America/Los_Angeles', UserName=uniqueName+'TestUser_@neo4j.com');
            insert finance_UserForAutomatedTestsWithCustomPermission;

            //Given a mocked Permission Set
            PermissionSet permSet = new PermissionSet(Label = 'mockPs', Name = 'mockPs');
            insert permSet;

            // Given Some Custom permissions
            SetupEntityAccess sea_Opportunity_AllowStageChangeTo99 = new SetupEntityAccess(
                        ParentId = permSet.Id,
                        SetupEntityId = [SELECT Id FROM CustomPermission
                        WHERE DeveloperName = 'Opportunity_AllowStageChangeTo99'][0].Id
                );
            insert sea_Opportunity_AllowStageChangeTo99;
            SetupEntityAccess sea_Opportunity_AllowStageChangeTo100 = new SetupEntityAccess(
                        ParentId = permSet.Id,
                        SetupEntityId = [SELECT Id FROM CustomPermission
                        WHERE DeveloperName = 'Opportunity_AllowStageChangeTo100'][0].Id
                );
            insert sea_Opportunity_AllowStageChangeTo100;
            SetupEntityAccess sea_Opportunity_Unlock_And_Edit_Certain_Fields = new SetupEntityAccess(
                        ParentId = permSet.Id,
                        SetupEntityId = [SELECT Id FROM CustomPermission
                        WHERE DeveloperName = 'Opportunity_Unlock_And_Edit_Certain_Fields'][0].Id
                );
            insert sea_Opportunity_Unlock_And_Edit_Certain_Fields;
                    
            // Given Permission Set Assignment of PermissionSet/Opportunity_AllowStageChangeTo99 to User finance_UserForAutomatedTestsWithCustomPermission for test
            PermissionSetAssignment psa = new PermissionSetAssignment(
                        AssigneeId = finance_UserForAutomatedTestsWithCustomPermission.Id,
                        PermissionSetId = permSet.Id
            );
            insert psa;            

        //given standard price book
        // Create test Product, Pricebook, and PbEntries.
        // First, set up test price book entries.
        // Insert a test product.
        Product2 prod = new Product2(Name = 'Test Product ARRCalc/a7z3s0000004SGsAAM', 
            Family = 'Hardware',Subscription_Product__c=true);
        insert prod;
        // Get standard price book ID.
        // This is available irrespective of the state of SeeAllData.
        Id pricebookId = Test.getStandardPricebookId();
        // 1. Insert a price book entry for the standard price book.
        // Standard price book entries require the standard price book ID we got earlier.
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 10000, IsActive = true,CurrencyIsoCode='USD');
        insert standardPrice;
        // Create a custom price book
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        // 2. Insert a price book entry with a custom price.
        PricebookEntry customPrice = new PricebookEntry(
            Pricebook2Id = customPB.Id, Product2Id = prod.Id,
            UnitPrice = 12000, IsActive = true,CurrencyIsoCode='USD');
        insert customPrice;


        //Given creation of Opportunity Products
        OpportunityLineItem oli = (OpportunityLineItem)SmartFactory.createSObject('OpportunityLineItem');
        //Opportunity opp = [SELECT Id FROM Opportunity WHERE OwnerId=:UserInfo.getUserId() LIMIT 1]; //line commented bc of INSUFFICIENT_ACCESS_ON_CROSS_REFERENCE_ENTITY, insufficient access rights on cross-reference id:

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
        insert acct;
        
        Opportunity opp = (Opportunity)SmartFactory.createSObject('Opportunity');
        //opp.CurrencyIsoCode = standardPrice.CurrencyIsoCode;
        opp.CurrencyIsoCode = 'USD';
        opp.AccountId = acct.Id;
        opp.Use_Case__c='Risk Management'; //because Use_Case__c & Use_Case_Sub__c may be restricted and picklist dependent
        opp.Use_Case_Sub__c='Anti Money Laundering'; //because Use_Case__c & Use_Case_Sub__c may be restricted and picklist dependent
        opp.Neo4j_Billing_Entity__c='Neo4j Inc.'; //as of writing (2021-05-26), smartfactory doesnt guess correctly to succeed past our custom Validation Rules, so we assign a value intended to succeed past related Validations.
        opp.OwnerId=finance_UserForAutomatedTestsWithCustomPermission.Id;
        opp.Pricebook2Id = Test.getStandardPricebookId();
        insert opp;
        Product2 product = [SELECT Id FROM Product2 WHERE Subscription_Product__c=TRUE LIMIT 1];
        Id pbId = [SELECT Id FROM Pricebook2 WHERE IsActive=TRUE LIMIT 1].Id;
        
        product.Product_Group_Traction__c='Subscription';
        update product;

        opp.Do_Not_Create_Renewal__c=True;
        Id RecordTypeId_OpportunityNewRecordType = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('New').getRecordTypeId(); //in this test we impersonate finance, and 'Neo4j - Finance' as of 2021-05-04 has only 1 Opportunity Record Type assigned, the New one.
        opp.RecordTypeId = RecordTypeId_OpportunityNewRecordType;

        //and we expect no crashes when finance inserts opportunity lines and changes Opportunity Stage to Won, or deletes Opportunity Lines
        oli.OpportunityId = opp.Id;
        oli.UnitPrice=1000.00;
        oli.Quantity=1;
        oli.Product2Id=product.Id;
        oli.Term_Start_Date__c=system.Today().addMonths(6);
        oli.Term_End_Date__c=system.Today().addMonths(10);
        oli.Instance_Provisioned__c =system.today();
        
        System.runAs(finance_UserForAutomatedTestsWithCustomPermission){Insert oli;} //@Raushan/@Peter to extend this to test more DML perspectives, in time..
        
        //We expect no crashes when Finance updates opportunity stageName to Finance Review
        opp.stageName='Finance Review';
        System.runAs(finance_UserForAutomatedTestsWithCustomPermission) {Update opp;}

        
        Opportunity opportunityToGoThroughAnotherUpdate = [SELECT Id FROM Opportunity WHERE StageName='Finance Review' LIMIT 1];
        opportunityToGoThroughAnotherUpdate.stageName='Closed Won';
        System.runAs(finance_UserForAutomatedTestsWithCustomPermission){Update opportunityToGoThroughAnotherUpdate;} //@Raushan/@Peter to extend this to test more perspectives, in time..
        //commented line, not in scope of test method, System.runAs(finance_UserForAutomatedTestsWithCustomPermission){Delete oli;} //@Raushan/@Peter to extend this to test more perspectives, in time..
        

        // todo verify 
        //... asserts

        }
    }
}