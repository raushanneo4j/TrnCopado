/*
<!--
/////////////////////// SalesOps Power Editor   ///////////////////////////////////////////////////////////////////////////////

Summary/Usecase:
    *A visualforcepage app for letting "bypassable_opportunity_fields1 granted user(s)"  edit (granted fields) on opps and not trigger "Validation Rules"
    *This code was written to respect "with sharing" as well as FLS via "accessibility" and "updateable" checks)
    **Due to the power of this page,  access is granted by salesforce@neo4j.com, salesops@neo4j.com, and approved by leadership/operations.

Admin/README:
    * The page accepts a single URL Parameter,  "?oppId" 
    * "bypassable_opportunity_fields1" setting,  which is a "Hierarchy Custom Setting" defined by admins at user-level, or Profile Level, or Org-wide Level.
    ** PowerEditor.page ui is controlled Hierarchy Custom Setting(s)
    
    **@admins, architecture rule of thumbs implied here:
        1. Its encouraged to excuse neo4j_apexBypass_context__c=true in each Validation Rule,    
            or if its unwise explicitly comment why in the Validation Rule  (analyze all meta that references neo4j_apexBypass_context__c to know).
    
        
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-->

*/
public with sharing class PowerEditorCTLR {  
//this code does "accessibility" and "updateable" checks to obey users FLS; the one exception is that system mode writes to neo4j_apexBypass_context__c)
//'with sharing' for two reasons:  1) obeys SFDC terms of service wrt licenses,   2) obeys record access/sharing

    public Opportunity opportunity {get; set;}
    //ApexPages.standardController m_sc = null; //supports cancel button to return to previous page. Credit to https://stackoverflow.com/questions/8921434/how-to-implement-cancel-functionality-in-a-visualforce-page
    public Id oppId {get;set;}
    public String  powerEditorUsage_optionalReason {get; set;} //a text field, optional, to capture why user is using powerEditor's save button/function.
    
    //custom setting management link to be displayed if viewer is an admin!, series
    public String manageUrl_for_bypassable_opportunity_fields1_Setting{get;set;}


   
    public PowerEditorCTLR() {
        if (!Test.isRunningTest()){ //This helps the test class succeed because: You cannot call addFields when the data is being passed into the controller by the caller.
            //controller.addFields(new String[]{'MQL_Source_Detail__c','MQL_Source__c','Lead_Source_Last_Modified__c','Original_Lead_Source_set_once__c','Lead_Source_Detail2__c','LeadSource','BDR_Qualification_Notes__c','LeadCreatedBy_V1_0098_ZoomInfo_Import__c'});
        }
        
        //custom settings management link(s) to be displayed if viewer is an admin!, series
        String bypassable_opportunity_fields1_relativePath = '/setup/ui/listCustomSettingsData.apexp';
        String bypassable_opportunity_fields1_prefix = SObjectType.bypassable_opportunity_fields1__c.getKeyPrefix();
        this.manageUrl_for_bypassable_opportunity_fields1_Setting = bypassable_opportunity_fields1_relativePath + '?id=' + bypassable_opportunity_fields1_prefix;

        
        //this.opportunity = (Opportunity)controller.getRecord();
        this.powerEditorUsage_optionalReason = null;
        this.oppId = ApexPages.currentPage().getparameters().get('oppId');  

        if(this.oppId!=null){  //we loaded the page from an opportunity, so assign the new opp some default field values based on some values from it
                
                if(!isValidSalesforceId(String.valueOf(this.oppId),Opportunity.class)){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Load failed. Please pass a valid "?oppId=xxxxxxxxxxxxxxx" into the URL.'));
                }
                
                //Selects/Loads fields that are both updateable (FLS) and allowed (bypass_specific_*_valRules__c HCS driving Power Editor)
                System.debug('getSObjectUpdatableFields for Opportunity: '+getSObjectUpdatableFields('Opportunity')); //Id love to write this dynamically for any Sobject, but https://trailblazer.salesforce.com/ideaView?id=08730000000E1eZAAS makes casting sobject List to specific sobject type unreliable.
                
                String theObject = 'Opportunity';
                List<String> bypassableFields = getSObjectUpdatableFields(theObject);
                if(bypassableFields.size()<1){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Load failed. Please ask salesops@neo4j.com for help defining any needed bypassableFields.'));
                    
                }
                
                String soql = 'SELECT '+ String.join(bypassableFields, ',');
                soql+=' FROM '+theObject + ' Where Id =\''+this.oppId+'\''; //Id love to write this dynamically for any Sobject, but https://trailblazer.salesforce.com/ideaView?id=08730000000E1eZAAS makes casting sobject List to specific sobject type unreliable.
                System.debug('soql: '+soql);
                System.debug('bypassableFields.size: '+bypassableFields.size());
                
                if(bypassableFields.size()>=1){
                this.opportunity = (Opportunity)Database.query(soql); //Id love to write this dynamically for any Sobject, but https://trailblazer.salesforce.com/ideaView?id=08730000000E1eZAAS makes casting sobject List to specific sobject type unreliable. //List<sObject> records = Database.query('Select Id, Name From ' + theObject + ' Where Id =:this.oppId'); //Id love to write this dynamically for any Sobject, but https://trailblazer.salesforce.com/ideaView?id=08730000000E1eZAAS makes casting sobject List to specific sobject type unreliable.
                } else {this.opportunity = null;}
                //for(SObject record : queryResults){} //Id love to write this dynamically for any Sobject, but https://trailblazer.salesforce.com/ideaView?id=08730000000E1eZAAS makes casting sobject List to specific sobject type unreliable.

        }
    }

    /**
    * Test a String to validate SFDC  ID format and 
    * @param  theAllegedSfIdString The ID to test.
    * @param  t      The Type of the sObject to compare against
    * @return        Returns true if the string sfdcId is valid, false if it is not.
    */
    public static Boolean isValidSalesforceId( String theAllegedSfIdString, System.Type t ){
        try {

            if ( Pattern.compile( '[a-zA-Z0-9]{15}|[a-zA-Z0-9]{18}' ).matcher( theAllegedSfIdString ).matches() ){
                // Try to assign it to an Id before checking the type
                Id id = theAllegedSfIdString;

                // Use the Type to construct an instance of this sObject
                sObject sObj = (sObject) t.newInstance();

                // Set the ID of the new object to the value to test
                sObj.Id = id;

                // If the tests passed, it's valid
                return true;
            }
        } catch ( Exception e ){
            System.debug('exception validating.. '+e.getMessage()); // other exceptions? StringException, TypeException
        }

        // ID is not valid
        return false;
    }

    public PageReference save(){
        if(!isValidSalesforceId(String.valueOf(this.oppId),Opportunity.class)){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,
            'Save failed. Please make sure the "oppId" parameter maps to a valid Opportunity, and refresh this page before you retry the save button. ErrorMessage:'));
            return null;
        } else if (this.opportunity!=null){
            
            //Essential to the "Power Editor" feature / page.
            this.opportunity.neo4j_apexBypass_context__c=true; // Many validation rules exclude/excuse by this.  Downstream declarative updates reset the flag.
            
            Id oppid = null; //given value later, based on save/update result.
            List<Opportunity> opportunitiesUpdatesList = new List<Opportunity>();
            try {

                    opportunitiesUpdatesList = updateOpportunity(opportunity);

                        if(opportunitiesUpdatesList.size()>0){

                            oppid = opportunitiesUpdatesList[0].Id;
                            /*Return notes
                            (https://salesforce.stackexchange.com/questions/14168/pagereference-return-null-vs-void/14169):

                                Returning Null will not refresh the view state. Unless we explicitly say that setredirect(true) the view state will be maintained. 
                                An action method with no return type (void) will not reset the view state.
                                http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_pages_pagereference.htm
                                A PageReference is a reference to an instantiation of a page. Among other attributes, PageReferences consist of a URL and a set of query parameter names and values. 
                                Use a PageReference object: To view or set query string parameters and values for a page To navigate the user to a different page as the result of an action method.

                                You should return void if there is no possibility of a redirect. 
                                This makes it clear to other developers that may later view the source code that there will be no redirect from this action function without examining the entire function. 
                                This is useful when the function spans hundreds of lines and includes complex control structures. 
                                In the application I am working on finishing up, the prior developer always returned a null page reference instead of using void, and it significantly slowed down my progress. – sfdcfox Sep 11 '13 at 15:52

                            https://salesforce.stackexchange.com/a/63290
                                If we assume an action method is a method invoked via some action= attribute on a VF page, then
                                When an action method returns null, it indicates to VF that the current page should be refreshed (SUCH AS WHEN DISPLAYING ERRORS OR SIMPLY DOING SOME AJAX ACTION)
                                When an action method returns a non null PageReference, then typically this indicates navigation to a different page (perhaps a new page in a multi-step wizard or a server-side redirection to a new page altogether)
                                Personally, I always declare my action methods as returning PageReference by convention but there are clearly examples where an action method won't navigate to a new page, and, as you've noted throughout SFSE, such methods are declared as void and work just fine

                            Neo4j by design     successes should redirect to the same page with same url params, clearing viewstate so that the controller can rebuild it.
                            
                                        PageReference pageRef = ApexPages.CurrentPage(); //same page
                                        Apexpages.Currentpage().getParameters.put('oppId',ApexPages.Currentpage().getparameters().get('oppId')); //same url params
                                        pageRef.setRedirect(true); //clears viewstate
                                        return pageRef;

                            
                            */
                            
                            PowerEditorUsage__c powerEditorUsage = new PowerEditorUsage__c(
                                FieldAPI__c='1.0.0 doesnt capture this',
                                Reasoning255__c=this.powerEditorUsage_optionalReason,
                                RecordID18__c=this.oppId
                            );
                            try{insert powerEditorUsage;}catch(Exception e){ //failure so return null so that the error is shown
                                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Save failed. Could not enter PowerEditorUsage__c. Ask salesops@neo4j.com for help. ErrorMessage:' + e.getMessage()));
                                return null;
                            }

                            //return new PageReference('/' + oppid); //success, so return to the resulting opportunity.
                            
                            /* //block commented because redirecting back to PowerEditor was unclear.  Rather would return null and show a confirmation.
                            PageReference pageRef = ApexPages.CurrentPage();
                            Apexpages.Currentpage().getParameters().put('oppId',ApexPages.Currentpage().getparameters().get('oppId')); //btw this block warrants removing rerender from !save action, because saves were giving me "Uncaught ReferenceError: Sfdc is not defined"  AJAXREQUEST related errors!
                            pageRef.setRedirect(true);
                            return pageRef; //success, so return the same page, same params, clearing view-state so that the optional reasoning inputText can be cleared.
                            */
                            return null; //so that the confirmation can be read.


                        } else{return null;}

            }
            catch(Exception e){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'An exception occurred. Contact salesforce@neo4j.com for assistance. ErrorMessage: ' + e.getMessage())); 
                    return null; //return null so DMLException can be displayed to the User
            }
        }
        return null;
    }

    public List<Opportunity> updateOpportunity(Opportunity opportunity) {

            try{
                Database.SaveResult[] results = Database.update(new SObject[] {
                opportunity});

                System.debug(opportunity.Id);

                for (Integer i = 0; i < results.size(); i++) {
                    if (results[i].isSuccess()) {
                    System.debug('Successfully updated ID: '
                        + results[i].getId());
                    } else {
                    System.debug('Error: could not update sobject '
                        + 'for array element ' + i + '.');
                    System.debug('   The error reported was: '
                        + results[i].getErrors()[0].getMessage() + '\n');
                    }
                }
                Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'PowerEditor successfully updated the record...')); 
            } catch (Exception e){
                ApexPages.addMessages(e);
                Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'PowerEditor did not update the record...')); 
            }

            return [Select Id From Opportunity Where Id = :opportunity.Id]; //refactored from boilerplate, todo probably dont need the query here, afterall we are just returning the id bc the save() method returns a return new PageReference that depends on it.
    }

    /*Start - supports cancel button to return to previous page. Credit to https://stackoverflow.com/questions/8921434/how-to-implement-cancel-functionality-in-a-visualforce-page*/
    public PageReference doCancel()
    {
        //return m_sc.cancel();
        if(oppId!=null){PageReference previousOppPage = new PageReference('/'+oppId); return previousOppPage;}
        return null;

    }
    /*End - supports cancel button to return to previous page. Credit to https://stackoverflow.com/questions/8921434/how-to-implement-cancel-functionality-in-a-visualforce-page*/

    public Component.Apex.PageBlock getDynamicForm() 
    {
        //Creating a PageBlock 
        Component.Apex.PageBlock dynPageBlock = new Component.Apex.PageBlock(); 
        dynPageBlock.id = 'dynPageBlockId';

        //Creating a PageBlockSection
        Component.Apex.PageBlockSection dynPageBlockSection = new Component.Apex.PageBlockSection();
        dynPageBlockSection.id='dynPageBlockSectionId';
        dynPageBlockSection.title = 'PowerEditor 1.0.0';
        dynPageBlockSection.columns = 2; 
        dynPageBlock.childComponents.add(dynPageBlockSection); 

        for( String field : getSObjectUpdatableFields('Opportunity'))
        { 
            //Creating a InputField
            Component.Apex.InputField theNameField = new Component.Apex.InputField();
            theNameField.expressions.value = '{!Opportunity.'+field+'}';
            //if(field =='Amount'){theNameField.required =true;}
            //if(field =='Type'){theNameField.required =true;}

            theNameField.id = 'the'+field+'Name'; 

            dynPageBlockSection.childComponents.add(theNameField);

        }

        return dynPageBlock;
    }


    public void doNothing() {
    }

    public static Boolean listContains(Object[] source, String target) { //we store comma separated text in a custom meta data record, and then split it to a list.  Apex does not support contains() on Lists, only sets.  Therefore this method helps us run contains() indirectly on Lists.  Credit to: //https://salesforce.stackexchange.com/questions/172606/list-contains-method-in-salesforce
    return (new Set<Object>(source)).contains(target);
    }

    public static List<String> getSObjectUpdatableFields(String sObjectName)
    {
        List<String> str = new List<String>();
        SObjectType sObjectType = Schema.getGlobalDescribe().get(sObjectName);
        Map<String,Schema.SObjectField> fields = sObjectType.getDescribe().fields.getMap();
        List<String> fieldNamesToIncludeList = new List<String>();
        String commaSeparatedToInclude = '';
        bypassable_opportunity_fields1__c bypassable_opportunity_fields1 = bypassable_opportunity_fields1__c.getInstance(); 
        if (bypassable_opportunity_fields1!=null){
            if(bypassable_opportunity_fields1.comma_separated_fields__c==null){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Access to this feature is not setup. For assistance please send your input requirements (and screenshot) to Salesforce@neo4j.com. [no bypassable_opportunity_fields.comma_separated_fields__c > detected]'));
            } else{
                commaSeparatedToInclude = bypassable_opportunity_fields1.comma_separated_fields__c;
                fieldNamesToIncludeList = commaSeparatedToInclude.split(',');
            }
        }

        for(Schema.SObjectField obj : fields.values()) 
        {    
            Schema.DescribeFieldResult fieldType = obj.getDescribe();
            
            if(  listContains(fieldNamesToIncludeList,fieldType.getName()) && fieldType.isAccessible() && fieldType.isUpdateable() )

            //isAccessible = Returns true if the current user can see this field, false otherwise.
            // isUpdateable = Returns true if the field can be edited by the current user, or child records in a master-detail relationship field on a custom object can be reparented to different parent records; false otherwise. 
            //isNillable = Returns true if the field is nillable, false otherwise. A nillable field can have empty content. A non-nillable field must have a value for the object to be created or saved.  A checkbox is true or false thus is (!isNillable)
                str.add(fieldType.getName()); //todo further restrict the (!isNillable) fields to adhere to a (whitelist)List Custom Setting because there are some (!isNillable) fields that i want to show (product checkboxes, etc) but others that i dont care about.
        } 
        str.sort();
        return str; 
    }
}