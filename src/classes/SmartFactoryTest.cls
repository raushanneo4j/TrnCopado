/*
   Copyright 2011 Mavens Consulting, Inc.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/   

@isTest
private class SmartFactoryTest {
    static {
        SmartFactory.FillAllFields = true; // increase test coverage without creating custom objects
        //SmartFactory.ExcludedFields.put('Contact',new Set<String>{'Opportunity__c'}); //exclude Opportunity__c lookup otherwise smartfactory would attempt opportunity creation
        //and  we dont have to navigate around opportunity validation rules in this test class.
        //SmartFactory.ExcludedFields.put('Account',new Set<String>{'Sugar_ID__c'});//we dont use Sugar crm anymore, so exclude the field to avoid dupe errors during tests.
        //SmartFactory.ExcludedFields.put('Contact',new Set<String>{'Sugar_ID__c'});//we dont use Sugar crm anymore, so exclude the field to avoid dupe errors during tests.
    }  
    
    static testMethod void createsSingleObjectWithSingleRequiredStringField() {
        Account account = (Account)SmartFactory.createSObject('Account');
        insert account;
        System.assert(account.Id != null);
        System.assert(account.Name != null);
    }
    
    /**
     * COMMENTED THIS BECAUSE Neo4j has a restricted picklist on opportunity Use_Case_Sub__c that depends on Use_case__c.  
     * The createsObjectWithCascadeSetsLookupField detects lookups and creates objects from it, 
     * which fails when picking an arbitrary picklist value.  The framework developer has a TODO mentioned to set default values, 
     * "Provide an field override map that allows callers to specify default values for specific objects and fields" https://github.com/mbotos/SmartFactory-for-Force.com
     * I tried to exclude the custom lookups that point to opportunity but either did not do it well enough because something with this method
     * trips the System.DmlException: Insert failed. First exception on row 0; first error: INVALID_OR_NULL_FOR_RESTRICTED_PICKLIST, bad value for restricted picklist field: Anti Money Laundering: [Use_Case_Sub__c]  13516 Class.SmartFactory.setFieldValue: line 221, column 1 Class.SmartFactory.createSObject: line 71, column 1 Class.SmartFactory.createSObject: line 78, column 1 Class.SmartFactoryTest.createsObjectWithCascadeSetsLookupField: line 54, column 1
     */
    /*static testMethod void createsObjectWithCascadeSetsLookupField() {
        SmartFactory.ExcludedFields.put('Contact',new Set<String>{'Opportunity__c'}); //exclude Opportunity__c lookup otherwise smartfactory would attempt opportunity creation //and  we dont have to navigate around opportunity validation rules in this test class.
        SmartFactory.ExcludedFields.put('accountOpportunityRole__c',new Set<String>{'Opportunity__c'}); //exclude Opportunity__c lookup otherwise smartfactory would attempt opportunity creation //and  we dont have to navigate around opportunity validation rules in this test class.
        SmartFactory.ExcludedFields.put('EmailMessage',new Set<String>{'Opportunity__c'}); //exclude Opportunity__c lookup otherwise smartfactory would attempt opportunity creation //and  we dont have to navigate around opportunity validation rules in this test class.
        SmartFactory.ExcludedFields.put('License_Key__c',new Set<String>{'Opportunity__c'}); //exclude Opportunity__c lookup otherwise smartfactory would attempt opportunity creation //and  we dont have to navigate around opportunity validation rules in this test class.
        
        SmartFactory.ExcludedFields.put('Account',new Set<String>{'Sugar_ID__c'});//we dont use Sugar crm anymore, so exclude the field to avoid dupe errors during tests.
        SmartFactory.ExcludedFields.put('Contact',new Set<String>{'Sugar_ID__c'});//we dont use Sugar crm anymore, so exclude the field to avoid dupe errors during tests.
        
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'pse__Salesforce_User__c'});
        //exclude other custom lookup fields 
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'pse__Region__c'});
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'pse__Practice__c'});
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'Opportunity__c'});
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'LeanData__Matched_Buyer_Persona__c'});
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'rh2__Describe__c'});
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'pse__Current_Time_Period__c'});
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'DNBoptimizer__DnBContactRecord__c'});
        SmartFactory.ExcludedFields.put('Opportunity',new Set<String>{'pse__Actuals_Last_Updated_By__c'});
        
        Contact contact = (Contact)SmartFactory.createSObject('Contact', true);
        insert contact;
        System.assert(contact.Id != null);
        System.assert(contact.AccountId != null);
    }*/
    
    static testMethod void createsObjectWithoutCascadeDoesNotSetLookupField() {
        Contact contact = (Contact)SmartFactory.createSObject('Contact', false);
        contact.Contact_Status__c = 'Recycle';// to avoid System.DmlException: Insert failed. First exception on row 0; first error: INVALID_OR_NULL_FOR_RESTRICTED_PICKLIST, bad value for restricted picklist field: Authority: [Contact_Status_Detail__c]	
        contact.Contact_Status_Detail__c = 'Authority';// to avoid System.DmlException: Insert failed. First exception on row 0; first error: INVALID_OR_NULL_FOR_RESTRICTED_PICKLIST, bad value for restricted picklist field: Authority: [Contact_Status_Detail__c]	
        insert contact;
        System.assert(contact.AccountId == null);
    }
    
    static testMethod void createObjectWithUnsupportedTypeThrowsException() {
        try {
            SmartFactory.createSObject('Unsupported');
            System.assert(false);
        } catch (UnsupportedObjectTypeException ex) {
            System.assert(true);
        }
    }
}