/* Friendly reminder about Trigger Context variables
new - Returns a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
old - Returns a list of the old versions of the sObject records. This sObject list is only available in update and delete triggers.
oldMap - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.

A note about feature architecture: Copado1
*SFDC-0145, spans beforeInsert, beforeUpdate.  AutoCalcs and ledgers ARR changes.  Ledger occurs on beforeInsert and beforeUpdate, a key variable differs between contexts,  oldARRConsidersPreviousTriggerRuns, to help.
* SFDC COPADO BRANCH MERGE Testing
*/
public with sharing class OpportunityLineItemTriggerHelper{ //the OpportunityLineItem Trigger Helper
    //start If neo4j_apexBypass_context__c is ever set to true, such as in controlled scenarios like grant-based PowerEditor updates, THEN this feature block ensures those paths exit by setting it back to false so that its never true when users are editing the record, series
    Private static Map <Id,boolean> oldIsBypassedMap = null; //follows Dan Appleman's pattern for recursion control,  this helps prevent recursion thus promote data quality within the neo4j_apexBypass_context__c field, read about it in his book or in https://salesforce.stackexchange.com/a/46798 
    //end If neo4j_apexBypass_context__c is ever set to true, such as in controlled scenarios like grant-based PowerEditor updates, THEN this feature block ensures those paths exit by setting it back to false so that its never true when users are editing the record, series
    public static boolean checkFirstOpp=false;
    public static List<OpportunityLineItem> newOpportunityLines; //monday consultant //represents trigger.new 
    public static List<OpportunityLineItem> oldOpportunityLines; //monday consultant //represents trigger.old 
    public static Map<Id, OpportunityLineItem> newMapOpportunityLines; //monday consultant //represents trigger.newMap 
    public static Map<Id, OpportunityLineItem> oldMapOpportunityLines; //monday consultant //represents trigger.oldMap 

    /*Using Custom Meta data to get the Aura product. This was developed as part of SFDCSPT-610 after retiring the 'Subscription - Aura Enterprise' */
    public static Product_Reference__mdt productRef=[Select NEOSUBAURA__c from Product_Reference__mdt where DeveloperName='ProductOrgData'];
    public static boolean runTrigger = TRUE; //consultant code
    
        //Start ARR CALC, SERIES
        Private static Map <Id,decimal> oldARRMap = null; //This helps triggers and declarative updates coexist safely when triggers must detect field changes //boiler plate is here: https://salesforce.stackexchange.com/a/46798/10073 but instead of isWon changes we are detecting ARR__c currency changes, //oldIsWonMap--> oldARRMap , etc.
        //End ARR CALC, SERIES
    
    
    /**OpportunityLineItem AFTER_UNDELETE //after undelete //no need to a7z3s0000004SGsAAM here
     * OppLineItemAfterUndelete 
     * @param  newOppLines represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  newMap      represents A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     */
    public static void OppLineItemAfterUndelete(list<OpportunityLineItem> newOppLines, map<Id,OpportunityLineItem> newMap){
        /* per Triggers and Recovered Records https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers_recovered_records.htm
            The after undelete trigger event only works with recovered records—that is, records that were deleted and then recovered from the Recycle Bin through the undelete DML statement. These are also called undeleted records.

            The after undelete trigger events only run on top-level objects. For example, if you delete an Account, an Opportunity may also be deleted. When you recover the Account from the Recycle Bin, the Opportunity is also recovered. If there is an after undelete trigger event associated with both the Account and the Opportunity, only the Account after undelete trigger event executes.
                
            The after undelete trigger event only fires for the following objects:
            Account
            Asset
            Campaign
            Case
            Contact
            ContentDocument
            Contract
            Custom objects
            Event
            Lead
            Opportunity
            Product
            Solution
            Task
        
            As such, we favor Opportunity trigger over this trigger for project https://neo4j--organizer.na122.visual.force.com/a7z3s0000004SGsAAM nicknameis: Enhance SFDC ARR Reporting (Auto calc and populate ARR) 'ARR calculation'
        */
            
    } 
    
    /**OpportunityLineItem AFTER_DELETE //after delete //no need to a7z3s0000004SGsAAM here
     * OppLineItemAfterDelete description
     * @param  newOppLines represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  oldOppLines represents trigger.old, a list of the old versions of the sObject records. This sObject list is only available in update and delete triggers.
     * @param  oldMap      oldMap description
     */
    public static void OppLineItemAfterDelete(list<OpportunityLineItem> newOppLines, list<OpportunityLineItem> oldOppLines, map<Id,OpportunityLineItem> oldMap){
        list<opportunity> updateOpp=New List<Opportunity>();
        set<id> oppID= new set<id>(); //stores opportunity ids of the related Opportunity line items.
        for(OpportunityLineItem oliTemp:oldOppLines){
            if(oliTemp.subscription__c==True)
            oppID.add(oliTemp.OpportunityID);
    }
        Map<id,opportunity> oppListMap=new Map<id,opportunity>([select id,name,num_subscription_opp_lines__c,Has_Subscription_Line_Items__c ,Term_End_Date_First_Subscription_OLI__c  from opportunity where id=:oppID]);
        for(OpportunityLineItem oliTempupdate:oldOppLines){
            if(oppListMap.containsKey(oliTempupdate.opportunityID) && oliTempupdate.Subscription__c==TRUE ){
                opportunity opp=oppListMap.get(oliTempupdate.opportunityID);
                if(opp.num_subscription_opp_lines__c==1){
                    opp.Has_Subscription_Line_Items__c=False;
                    updateOpp.add(opp);
                }
            }
        }
        if(!updateOpp.isEmpty()){
            update updateOpp;
        }
    }
    
    /**OpportunityLineItem AFTER_INSERT //no need to a7z3s0000004SGsAAM here
     * OppLineItemAfterInsert 
     * @param  newOppLines represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  newMap      represents trigger.newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     * @param  oldMap      represents trigger.oldMaP - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.
     */
    public static void OppLineItemAfterInsert(list<OpportunityLineItem> newOppLines, map<Id,OpportunityLineItem> newMap, map<Id,OpportunityLineItem> oldMap){
            
    }
    /**OpportunityLineItem AFTER_UPDATE //no need to a7z3s0000004SGsAAM here
     * OppLineItemAfterUpdate
     * @param  newOppLines represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  newMap      represents trigger.newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     * @param  oldMap      represents trigger.oldMaP - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.
     */
    public static void OppLineItemAfterUpdate(list<OpportunityLineItem> newOppLines, map<Id,OpportunityLineItem> newMap, map<Id,OpportunityLineItem> oldMap){
        
     list<opportunity> updateOpp=New List<Opportunity>();
        set<id> oppID= new set<id>(); //stores opportunity ids of the related Opportunity line items.
        for(OpportunityLineItem oliTemp:newOppLines){
            oppID.add(oliTemp.OpportunityID);
        }
        Map<id,opportunity> oppListMap=new Map<id,opportunity>([select id,name,Term_End_Date_First_Subscription_OLI__c  from opportunity where id=:oppID]);
        for(OpportunityLineItem oliTempupdate:newOppLines){
            if(oppListMap.containsKey(oliTempupdate.opportunityID) && oliTempupdate.Subscription__c==TRUE && oliTempupdate.Professional_Services__c==False){
                opportunity opp=oppListMap.get(oliTempupdate.opportunityID);
                if(opp.Term_End_Date_First_Subscription_OLI__c ==Null ){
                    opp.Term_End_Date_First_Subscription_OLI__c=oliTempupdate.Term_End_date__c;
                    updateOpp.add(opp);
                }
                else if(opp.Term_End_Date_First_Subscription_OLI__c != Null && opp.Term_End_Date_First_Subscription_OLI__c!= oliTempupdate.Term_End_date__c){
                    opp.Term_End_Date_First_Subscription_OLI__c=oliTempupdate.Term_End_date__c;
                    updateOpp.add(opp);
                }
            }
        }
        if(!updateOpp.isEmpty()){
        update updateOpp;
        }

    }
    /**OpportunityLineItem BEFORE_INSERT //before insert //supports ARRCalc a7z3s0000004SGsAAM
     * OppLineItemBeforeInsert
     * @param  newOppLines represents trigger.new - a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     */
    public static void OppLineItemBeforeInsert(list<OpportunityLineItem> newOppLines){
        for(OpportunityLineItem oli : newOppLines) {
            
            
            
        }
        
        //start maintain OpportunityLineItem.Subscription2__c field, series (BTW, OpportunityLinteItem.Subscription2__c replaces OpportunityLinteItem.Subscription__c. OpportunityLinteItem.Subscription__c (formula) pre-dates me, and suffers this GA LIMIT ideaView?id=08730000000DfL5AAK. OpportunityLinteItem.Subscription2__c solves that a VR enforces "Dont edit this field, let the apex edit this field". OpportunityLineItem.Subscription2__c SOON REPLACES /00N6A000009M85o/e?setupid=OpportunityLineItemFields&retURL=%2F00N6A000009M85o. OpportunityLineItem.Subscription2__c is maintained by Apex because Process Builders are slower than apex and this org has performance issues. Chose Apex over WFRFU because of GA LIMIT ideaView?id=08730000000BqKe), series
            Set<Id> productIDs_20210128T69tzminus0800 = new Set<Id>();
            for(OpportunityLineItem oli : newOppLines) {
            productIDs_20210128T69tzminus0800.add(oli.Product2Id);
            }
            Map<Id, Product2> productMap_20210128T69tzminus0800 = new Map<Id, Product2>([SELECT Id, Subscription_Product__c,Professional_Services__c FROM Product2 WHERE Id IN :productIDs_20210128T69tzminus0800]);
            for(OpportunityLineItem oli : newOppLines) {
            Product2 relatedProduct = productMap_20210128T69tzminus0800.get(oli.Product2Id);
            //System.debug(productMap_20210128T69tzminus0800.get(oli.Product2Id).Subscription_Product__c);
            oli.Subscription2__c = productMap_20210128T69tzminus0800.get(oli.Product2Id).Subscription_Product__c;
            //Below line was added as part of https://sfdxspt-neoj4.atlassian.net/browse/SFDCSPT-529; Below line solves tha same problem as above.
            oli.Professional_Services2__c=productMap_20210128T69tzminus0800.get(oli.Product2Id).Professional_Services__c;
        }
        //end maintain OpportunityLineItem.Subscription2__c field, series (BTW, OpportunityLinteItem.Subscription2__c replaces OpportunityLinteItem.Subscription__c. OpportunityLinteItem.Subscription__c (formula) pre-dates me, and suffers this GA LIMIT ideaView?id=08730000000DfL5AAK. OpportunityLinteItem.Subscription2__c solves that a VR enforces "Dont edit this field, let the apex edit this field". OpportunityLineItem.Subscription2__c SOON REPLACES /00N6A000009M85o/e?setupid=OpportunityLineItemFields&retURL=%2F00N6A000009M85o. OpportunityLineItem.Subscription2__c is maintained by Apex because Process Builders are slower than apex and this org has performance issues. Chose Apex over WFRFU because of GA LIMIT ideaView?id=08730000000BqKe), series
        //start December 17, 2020 pre-cpq requirement from Lance.Kaji@neo4j.com around automatically writing to OpportunityLineItem.List_Contract_Price_per_GB_for_Aura__c whenever the records saved and has product2.name == 'Subscription - Aura Enterprise'. //pattern follows https://salesforce.stackexchange.com/a/211400, we dont have to handle currency changes on the opportunity level because salesforce mandates that to change opp currency you must remove all products first from the opportunity! of https://help.salesforce.com/articleView?id=000334284&type=1&mode=1, series
            Map<String, Decimal> oliCurrencyCodeToValue = new Map<String, Decimal>();
            Set<Id> productIDs = new Set<Id>();
            for(OpportunityLineItem oli : newOppLines) {
                oliCurrencyCodeToValue.put(oli.CurrencyIsoCode, null); //we'll put values from settings into the values soon
                productIDs.add(oli.Product2Id);
            }
            Map<Id, Product2> productMap = new Map<Id, Product2>([SELECT Id, Name FROM Product2 WHERE Id IN :productIDs]);
            for(OpportunityLineItem oli : newOppLines) {
                Product2 relatedProduct = productMap.get(oli.Product2Id);
                //System.debug(productMap.get(oli.Product2Id).Name);
            }
                
                for(AuraCurrencyListPrice__mdt record: [SELECT CurrencyIsoCode__c, AuraCurrencyListPrice__c FROM AuraCurrencyListPrice__mdt WHERE CurrencyIsoCode__c = :oliCurrencyCodeToValue.keySet()]) {
                    oliCurrencyCodeToValue.put(record.CurrencyIsoCode__c, record.AuraCurrencyListPrice__c);
                    }
                for (OpportunityLineItem oli : newOppLines) {
                    if(productMap.get(oli.Product2Id).Name == productRef.NEOSUBAURA__c){ //because of the context, only do work when the product2.name equals "Subscription - Aura Enterprise" // As part of SFDCSPT-610 we replaced the Hard coded name of the Product by Custom Meta data;    
                        oli.List_Contract_Price_per_GB_for_Aura__c = oliCurrencyCodeToValue.get(oli.CurrencyIsoCode); //the work
                    } else{
                        //System.debug('do nothing, because product name was not Subscription - Aura Enterprise'); // Update - No more Subscription - Aura Enterprise Product inside the Org and has been replaced by 'Neo4j AuraDB'
                        //return; //commented this line on 2021-01-11, dont return! there may be more work to do in this transaction.
                    }
                }            
        //end December 17, 2020 pre-cpq requirement from Lance.Kaji@neo4j.com around automatically writing to OpportunityLineItem.List_Contract_Price_per_GB_for_Aura__c whenever the records saved and has product2.name == 'Subscription - Aura Enterprise'. //pattern follows https://salesforce.stackexchange.com/a/211400, we dont have to handle currency changes on the opportunity level because salesforce mandates that to change opp currency you must remove all products first from the opportunity! of https://help.salesforce.com/articleView?id=000334284&type=1&mode=1, series
        //START ARR CALC, SERIES
                         //start: monthsBetween method return examples
                            
                            //Date sd = date.newInstance(2020,07,01);
                            //Date ed = date.newInstance(2020,08,01);
                            ////System.debug('RETURNS: ' + sd.monthsBetween(ed.addDays(1)));        //Returns 1

                            //Date sd = date.newInstance(2020,07,01);
                            //Date ed = date.newInstance(2020,08,02);
                            ////System.debug('RETURNS: ' + sd.monthsBetween(ed.addDays(1)));        //Returns 1

                            //Date sd = date.newInstance(2020,07,01);
                            //Date ed = date.newInstance(2020,08,31);
                            ////System.debug('RETURNS: ' + sd.monthsBetween(ed.addDays(1)));        //Returns 2


                            //Date sd = date.newInstance(2020,07,01);
                            //Date ed = date.newInstance(2020,08,30);
                            ////System.debug('RETURNS: ' + sd.monthsBetween(ed.addDays(1)));        //Returns 1


                            //Date sd = date.newInstance(2020,06,30);
                            //Date ed = date.newInstance(2020,08,31);
                            ////System.debug('RETURNS: ' + sd.monthsBetween(ed.addDays(1)));        //Returns 3


                            //Date sd = date.newInstance(2020,06,30);
                            //Date ed = date.newInstance(2020,08,30);
                            ////System.debug('RETURNS: ' + sd.monthsBetween(ed.addDays(1)));        //Returns 2
                        
                        //end: monthsBetween method return examples
                    
                        if(oldARRMap == null) {oldARRMap = new map<Id,decimal >();}
                        map<Id,OpportunityLineItem> justChangedOppLineARRMap = new map<Id,OpportunityLineItem>(); //justWonOppsMap --> justChangedOppLineARRMap
                        Map<Id, Opportunity> opportunities = new Map<Id, Opportunity>(); //cache so that we can use the information in conditionals that drive when to arr calc vs when not to.
                        for (OpportunityLineItem oli : newOppLines) {//for (OpportunityLineItem oli : Trigger.new) {
                            opportunities.put(oli.OpportunityId, null); //Although context is before_update,  note that in b4inserts ("before insert"), there's no record to query (Id is null). You can change this to an after-insert trigger, or you can use a validation rule.
                        }
                        opportunities.putAll([SELECT Id,IsWon,IsClosed,Probability,StageName FROM Opportunity WHERE Id = :opportunities.keySet()]);
                        for (OpportunityLineItem oli : newOppLines) {

                            Integer stepOne; //"Step1= (TED+1) - TSD"
                            Date stepTwo; //"Step2=(step1 +TSD) - 1day ---> yields a date
                            Integer stepThree; //"Step3= TED - step2"
                            Decimal stepFour; //"Step4= this googleSheet step doesnt handle leap year but we can handle leap year on the salesforce side"
                            Decimal stepFive; //"Step5= step1 + step4"

                            //System.debug('@@ oli.subscrip:'+oli.Subscription__c + '@@ opportunities.get(oli.OpportunityId).IsWon:'+opportunities.get(oli.OpportunityId).IsWon + '@@ opportunities.get(oli.OpportunityId).IsClosed:'+opportunities.get(oli.OpportunityId).IsClosed + '@@ opportunities.get(oli.OpportunityId).Probability:'+opportunities.get(oli.OpportunityId).Probability);
                            //If subscription, non-won, open-staged, not 'Finance Review' (todo exclude 99 probability deals as well)...
                            if(oli.Subscription__c && !opportunities.get(oli.OpportunityId).IsWon && !opportunities.get(oli.OpportunityId).IsClosed 
                            && opportunities.get(oli.OpportunityId).StageName!='Finance Review' && oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c==null){ 
                                //"If term dates are not populated and contract months are it will calculate estimated ARR based on "Contract Terms (in Months)"
                                if( ((oli.Term_Start_Date__c==null) || (oli.Term_End_Date__c==null)) && oli.Contract_Terms__c!=null && oli.Contract_Terms__c>0){
                                    oli.arr__c = ((oli.UnitPrice * oli.Quantity) / ((oli.Contract_Terms__c)/12));
                                    //System.debug('OppLineItemBeforeInsert(debug1) oli.arr__c = ((oli.UnitPrice * oli.Quantity) / ((oli.Contract_Terms__c)/12));');
                                }
                                //else "if both term dates and contract term (in months) are blank, then we use an assumption and default to an annual deal"
                                else if (oli.Term_Start_Date__c==null && oli.Term_End_Date__c==null && oli.Contract_Terms__c==null){
                                    oli.arr__c = (oli.UnitPrice * oli.Quantity);
                                    //System.debug('OppLineItemBeforeInsert(debug2) oli.arr__c = (oli.UnitPrice * oli.Quantity);}');
                                }
                                //else "if both (term dates) are populated, it will calculate from the term dates"
                                else if (oli.Term_Start_Date__c!=null && oli.Term_End_Date__c!=null){
                                    //stepOne = oli.Term_Start_Date__c.monthsBetween(oli.Term_End_Date__c.addDays(1));
                                    stepOne = getWholeMonthsBetweenTwoDatesAsDecimal(oli.Term_Start_Date__c,oli.Term_End_Date__c).intValue();
                                    stepTwo = oli.Term_Start_Date__c.addMonths(stepOne).addDays(-1);
                                    stepThree  = math.abs(oli.Term_End_Date__c.daysBetween(stepTwo));
                                    
                                    //Inaccurate Requirements for stepFour variable calculation Noticed on 2021-04-14: Attn Krzys, Ive spotted a bug in the google sheet as well for you to please fix: The google sheet doesnt handle leap year, so is wrong sometimes.  For example google sheet's step 4 uses bad data in the following example because it doesnt handle leap year.  Example: Aug 18 2021 to Feb/24/2024 whereby the sheet incorrectly calculates step four as 0.25  because it thinks 28 days in Feb.  However thats wrong because Feb 2024 has 29 days.  SFDC uses 29 because it handles for leapyear in this step.  Please update the sheet or expectations accordingly because i assume sfdc is more accurate w/r/t leapyear..
                                    stepFour = (Double)stepThree / (Date.daysInMonth(oli.Term_End_Date__c.Year(), oli.Term_End_Date__c.Month()));//Integer division in apex drops the remainder;  can find it again with the math.mod function, or an effective alternate solution is to explicitly convert one of the values in the division expression to a Double before the division operation is performed.
                                    
                                    stepFive = stepOne + stepFour;
                                    system.debug('OppLineItemBeforeInsert(debug: stepOne=)'+stepOne);
                                    system.debug('OppLineItemBeforeInsert(debug: stepTwo=)'+stepTwo);
                                    system.debug('OppLineItemBeforeInsert(debug: stepThree=)'+stepThree);
                                    system.debug('OppLineItemBeforeInsert(debug: stepFour=)'+stepFour);
                                    system.debug('OppLineItemBeforeInsert(debug: stepFive=)'+stepFive);
                                    oli.arr__c = (  (oli.UnitPrice * oli.Quantity) / stepFive        )*12;
                                } 
                                //else "if we have have Term Dates but not Contract Months then calculate from the (validated) term dates"
                                else if (oli.Term_Start_Date__c!=null && oli.Term_End_Date__c!=null && (oli.Contract_Terms__c==null ||oli.Contract_Terms__c==0)){                                    
                                    //stepOne = oli.Term_Start_Date__c.monthsBetween(oli.Term_End_Date__c.addDays(1));
                                    stepOne = getWholeMonthsBetweenTwoDatesAsDecimal(oli.Term_Start_Date__c,oli.Term_End_Date__c).intValue();
                                    stepTwo = oli.Term_Start_Date__c.addMonths(stepOne).addDays(-1);
                                    stepThree  = math.abs(oli.Term_End_Date__c.daysBetween(stepTwo));
                                    
                                    //Inaccurate Requirements for stepFour variable calculation Noticed on 2021-04-14: Attn Krzys, Ive spotted a bug in the google sheet as well for you to please fix: The google sheet doesnt handle leap year, so is wrong sometimes.  For example google sheet's step 4 uses bad data in the following example because it doesnt handle leap year.  Example: Aug 18 2021 to Feb/24/2024 whereby the sheet incorrectly calculates step four as 0.25  because it thinks 28 days in Feb.  However thats wrong because Feb 2024 has 29 days.  SFDC uses 29 because it handles for leapyear in this step.  Please update the sheet or expectations accordingly because i assume sfdc is more accurate w/r/t leapyear..
                                    stepFour = (Double)stepThree / (Date.daysInMonth(oli.Term_End_Date__c.Year(), oli.Term_End_Date__c.Month()));//Integer division in apex drops the remainder;  can find it again with the math.mod function, or an effective alternate solution is to explicitly convert one of the values in the division expression to a Double before the division operation is performed.
                                    
                                    stepFive = stepOne + stepFour;
                                    system.debug('OppLineItemBeforeInsert(debug: stepOne=)'+stepOne);
                                    system.debug('OppLineItemBeforeInsert(debug: stepTwo=)'+stepTwo);
                                    system.debug('OppLineItemBeforeInsert(debug: stepThree=)'+stepThree);
                                    system.debug('OppLineItemBeforeInsert(debug: stepFour=)'+stepFour);
                                    system.debug('OppLineItemBeforeInsert(debug: stepFive=)'+stepFive);
                                    oli.arr__c = (  (oli.UnitPrice * oli.Quantity) / stepFive        )*12;
                                }
                                //else fallback to $0.0
                                //else if (opportunities.get(oli.OpportunityId).StageName!='Finance Review' && opportunities.get(oli.OpportunityId).StageName!='Sales Ops Review'){oli.arr__c=0;system.debug('OppLineItemBeforeInsert(debug9) oli.arr__c=0;');}
                                //else{oli.arr__c=0; system.debug('OppLineItemBeforeInsert(debug10) oli.arr__c=0;');}
                            //Scenario: Using SOPS_Override_ARR_Calc_for_PipeLTE98__c  
                            } else if (oli.Subscription__c && !opportunities.get(oli.OpportunityId).IsWon && !opportunities.get(oli.OpportunityId).IsClosed && opportunities.get(oli.OpportunityId).StageName!='Finance Review' && oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c!=null){ //There's a SOPS_Override_ARR_Calc_for_PipeLTE98__c  ! Therefore IF  <same condition as ARR Calc  + SOPS_Override_ARR_Calc_for_PipeLTE98__c>  THEN we use it!
                                //oli.arr__c = oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c; system.debug('OppLineItemBeforeInsert(debug11) oli.arr__c = oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c;'); //There's a SOPS_Override_ARR_Calc_for_PipeLTE98__c  ! Therefore IF  <same condition as ARR Calc  + SOPS_Override_ARR_Calc_for_PipeLTE98__c>  THEN we use it!
                            }
                            //This checks to see if there was a value set in a previous trigger run
                            decimal oldARRConsidersPreviousTriggerRuns = (oldARRMap.containsKey(oli.id)) ? oldARRMap.get(oli.id) : null; //null because of context.  Compare to before update where its "oldMap.get(oli.id).ARR__c"  //COMMENT FROM ANOTHER CONTEXTS BOILERPLATE --> boolean oldIsWon --> decimal oldARRConsidersPreviousTriggerRuns // boilerplated from //boolean oldIsWon = (oldIsWonMap.containsKey(oli.id)) ? oldIsWonMap.get(oli.id) : oldmap.get(oli.id).isWon;
        
                            //this checks the current opp value with the 'correct' old value
                            if(oli.ARR__c != oldARRConsidersPreviousTriggerRuns){
                                justChangedOppLineARRMap.put(oli.Id, oli);}
                        
                            //this puts in the 'correct' old value in case the trigger is run again in the same context
                            if(oldARRConsidersPreviousTriggerRuns != oli.ARR__c) {
                                oldARRMap.put(oli.id,oli.ARR__c);}
                        }
                
                        List<OpportunityLineItemCustomFieldHistory__c> oliCustomHistoriesToInsertList = new List<OpportunityLineItemCustomFieldHistory__c>();
                            for (OpportunityLineItem oli : justChangedOppLineARRMap.values()){
                                    //System.debug('@@debug: OpportunityLineItem before insert'); //because of context
                                    oliCustomHistoriesToInsertList.add(new OpportunityLineItemCustomFieldHistory__c(OpportunityLineItem_Record_Id__c = oli.Id, //because of context
                                    Object_Name__c = 'OpportunityLineItem',
                                    Field_Name__c = 'ARR__c',
                                    Previous_Value__c = null,// because beforeInsert
                                    Current_Value__c = oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c==null? oli.ARR__c : oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c, //because of context
                                    developer_note__c = oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c==null? 'called from before insert without oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c' : 'called from before insert WITH/USING oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c', //because of context
                                    Modified_Date_Time__c = System.now(),
                                    Modified_By__c = UserInfo.getUserId(),
                                    OpportunityId__c=oli.OpportunityId,
                                    OpportunityLookup__c=oli.OpportunityId
                                    ));
                                    //System.debug('@@###debug: OpportunityLineItem ...... oliCustomHistoriesToInsertList.size() == '+oliCustomHistoriesToInsertList.size());
                            }
                            if(!oliCustomHistoriesToInsertList.isEmpty()) {try {
                                //insert histories
                                insert oliCustomHistoriesToInsertList;} catch (Exception e) {
                                //System.debug('@@Error############ in_opportunitylineitem_contexts_to_track_ARR_field_history_as_a_workaround_for_sfdc_ga_limitation_ideaview_0873a000000e8ccqas): ' + e);
                            }}        
                //END ARR CALC, SERIES
            
    }
    
    /**OpportunityLineItem BEFORE_UPDATE //before update //supports ARRCalc a7z3s0000004SGsAAM
     * OppLineItemBeforeUpdate
     * @param  newOppLines represents trigger.new, a list of the new versions of the sObject records. This sObject list is only available in insert, update, and undelete triggers, and the records can only be modified in before triggers.
     * @param  oldOppLines represents trigger.old - a list of the old versions of the sObject records. This sObject list is only available in update and delete triggers.
     * @param  newMap      represents trigger.newMap - A map of IDs to the new versions of the sObject records. This map is only available in before update, after insert, after update, and after undelete triggers.
     * @param  oldMap      represents trigger.oldMaP - A map of IDs to the old versions of the sObject records. This map is only available in update and delete triggers.
     */
    public static void OppLineItemBeforeUpdate(list<OpportunityLineItem> newOppLines, list<OpportunityLineItem> oldOppLines, map<Id,OpportunityLineItem> newMap, map<Id,OpportunityLineItem> oldMap) {
        for(OpportunityLineItem oli : newOppLines) {
            
        }
        
        //start maintain OpportunityLineItem.Subscription2__c field, series (BTW, OpportunityLinteItem.Subscription2__c replaces OpportunityLinteItem.Subscription__c. OpportunityLinteItem.Subscription__c (formula) pre-dates me, and suffers this GA LIMIT ideaView?id=08730000000DfL5AAK. OpportunityLinteItem.Subscription2__c solves that a VR enforces "Dont edit this field, let the apex edit this field". OpportunityLineItem.Subscription2__c SOON REPLACES /00N6A000009M85o/e?setupid=OpportunityLineItemFields&retURL=%2F00N6A000009M85o. OpportunityLineItem.Subscription2__c is maintained by Apex because Process Builders are slower than apex and this org has performance issues. Chose Apex over WFRFU because of GA LIMIT ideaView?id=08730000000BqKe), series
            Set<Id> productIDs_20210128T69tzminus0800 = new Set<Id>();
            for(OpportunityLineItem oli : newOppLines) {
            productIDs_20210128T69tzminus0800.add(oli.Product2Id);
            }
            Map<Id, Product2> productMap_20210128T69tzminus0800 = new Map<Id, Product2>([SELECT Id, Subscription_Product__c FROM Product2 WHERE Id IN :productIDs_20210128T69tzminus0800]);
            for(OpportunityLineItem oli : newOppLines) {
            Product2 relatedProduct = productMap_20210128T69tzminus0800.get(oli.Product2Id);
            //System.debug(productMap_20210128T69tzminus0800.get(oli.Product2Id).Subscription_Product__c);
            oli.Subscription2__c = productMap_20210128T69tzminus0800.get(oli.Product2Id).Subscription_Product__c;
            }
        //end maintain OpportunityLineItem.Subscription2__c field, series (BTW, OpportunityLinteItem.Subscription2__c replaces OpportunityLinteItem.Subscription__c. OpportunityLinteItem.Subscription__c (formula) pre-dates me, and suffers this GA LIMIT ideaView?id=08730000000DfL5AAK. OpportunityLinteItem.Subscription2__c solves that a VR enforces "Dont edit this field, let the apex edit this field". OpportunityLineItem.Subscription2__c SOON REPLACES /00N6A000009M85o/e?setupid=OpportunityLineItemFields&retURL=%2F00N6A000009M85o. OpportunityLineItem.Subscription2__c is maintained by Apex because Process Builders are slower than apex and this org has performance issues. Chose Apex over WFRFU because of GA LIMIT ideaView?id=08730000000BqKe), series        
        //start December 17, 2020 pre-cpq requirement from Lance.Kaji@neo4j.com around automatically writing to OpportunityLineItem.List_Contract_Price_per_GB_for_Aura__c whenever the records saved and has product2.name == 'Subscription - Aura Enterprise'. //pattern follows https://salesforce.stackexchange.com/a/211400, we dont have to handle currency changes on the opportunity level because salesforce mandates that to change opp currency you must remove all products first from the opportunity! of https://help.salesforce.com/articleView?id=000334284&type=1&mode=1, series
            Map<String, Decimal> oliCurrencyCodeToValue = new Map<String, Decimal>();
                Set<Id> productIDs = new Set<Id>();
                for(OpportunityLineItem oli : newOppLines) {
                    productIDs.add(oli.Product2Id);
                    oliCurrencyCodeToValue.put(oli.CurrencyIsoCode, null); //we'll put values from settings into the values soon
                }
                Map<Id, Product2> productMap = new Map<Id, Product2>([SELECT Id, Name FROM Product2 WHERE Id IN :productIDs]);
                for(OpportunityLineItem oli : newOppLines) {
                    Product2 relatedProduct = productMap.get(oli.Product2Id);
                    //System.debug(productMap.get(oli.Product2Id).Name);
                }
                    
                    for(AuraCurrencyListPrice__mdt record: [SELECT CurrencyIsoCode__c, AuraCurrencyListPrice__c FROM AuraCurrencyListPrice__mdt WHERE CurrencyIsoCode__c = :oliCurrencyCodeToValue.keySet()]) {
                        oliCurrencyCodeToValue.put(record.CurrencyIsoCode__c, record.AuraCurrencyListPrice__c);
                        }
                    for (OpportunityLineItem oli : newOppLines) {
                        if(productMap.get(oli.Product2Id).Name == productRef.NEOSUBAURA__c){ //because of the context, only do work when the product2.name equals "Subscription - Aura Enterprise" // As part of SFDCSPT-610 we replaced the Hard coded name of the Product by Custom Meta data;
                            
                            oli.List_Contract_Price_per_GB_for_Aura__c = oliCurrencyCodeToValue.get(oli.CurrencyIsoCode); //the work
                        } else{
                            //System.debug('do nothing, because product name was not Subscription - Aura Enterprise');// Update - No more Subscription - Aura Enterprise Product inside the Org and has been replaced by 'Neo4j AuraDB'
                            //return; //commented this line on 2021-01-11, dont return! there may be more work to do in this transaction.
                        }
                    }                
        //end December 17, 2020 pre-cpq requirement from Lance.Kaji@neo4j.com around automatically writing to OpportunityLineItem.List_Contract_Price_per_GB_for_Aura__c whenever the records saved and has product2.name == 'Subscription - Aura Enterprise'. //pattern follows https://salesforce.stackexchange.com/a/211400, we dont have to handle currency changes on the opportunity level because salesforce mandates that to change opp currency you must remove all products first from the opportunity! of https://help.salesforce.com/articleView?id=000334284&type=1&mode=1, series // Update - No more Subscription - Aura Enterprise Product inside the Org and has been replaced by 'Neo4j AuraDB'
        //START ARR CALC, SERIES ('//CORE LOGIC "calculate opportunitylineitem.ARR__c if subscription line items belonging to non-won, non-closed opportunities"')
        if(oldARRMap == null) {oldARRMap = new map<Id,decimal >();}
        map<Id,OpportunityLineItem> justChangedOppLineARRMap = new map<Id,OpportunityLineItem>(); //justWonOppsMap --> justChangedOppLineARRMap
        Map<Id, Opportunity> opportunities = new Map<Id, Opportunity>(); //cache so that we can use the information in conditionals that drive when to arr calc vs when not to.
        for (OpportunityLineItem oli : newOppLines) {//for (OpportunityLineItem oli : Trigger.new) {
            opportunities.put(oli.OpportunityId, null); //Although context is before_update,  note that in b4inserts ("before insert"), there's no record to query (Id is null). You can change this to an after-insert trigger, or you can use a validation rule.
        }
        opportunities.putAll([SELECT Id,IsWon,IsClosed,Probability,StageName FROM Opportunity WHERE Id = :opportunities.keySet()]);
        for (OpportunityLineItem oli : newOppLines) {
            Integer stepOne; //"Step1= (TED+1) - TSD"
            Date stepTwo; //"Step2=(step1 +TSD) - 1day ---> yields a date
            Integer stepThree; //"Step3= TED - step2"
            Decimal stepFour; //"Step4= this googleSheet step doesnt handle leap year but we can handle leap year on the salesforce side"
            Decimal stepFive; //"Step5= step1 + step4"
            //System.debug('@@ oli.subscrip:'+oli.Subscription__c + '@@ opportunities.get(oli.OpportunityId).IsWon:'+opportunities.get(oli.OpportunityId).IsWon + '@@ opportunities.get(oli.OpportunityId).IsClosed:'+opportunities.get(oli.OpportunityId).IsClosed + '@@ opportunities.get(oli.OpportunityId).Probability:'+opportunities.get(oli.OpportunityId).Probability);
            //If subscription, non-won, open-staged, not 'Finance Review' (todo exclude 99 probability deals as well)...
            if(oli.Subscription__c && !opportunities.get(oli.OpportunityId).IsWon && !opportunities.get(oli.OpportunityId).IsClosed 
            && opportunities.get(oli.OpportunityId).StageName!='Finance Review' && oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c==null){
                //"If term dates are not populated and contract months are it will calculate estimated ARR based on "Contract Terms (in Months)"
                if( ((oli.Term_Start_Date__c==null) || (oli.Term_End_Date__c==null)) && oli.Contract_Terms__c!=null && oli.Contract_Terms__c>0){
                    oli.arr__c = ((oli.UnitPrice * oli.Quantity) / ((oli.Contract_Terms__c)/12));
                    //system.debug('OppLineItemBeforeUpdate(debug1) oli.arr__c = ((oli.UnitPrice * oli.Quantity) / ((oli.Contract_Terms__c)/12));');
                }
                //else "if both term dates and contract term (in months) are blank, then we use an assumption and default to an annual deal"
                else if (oli.Term_Start_Date__c==null && oli.Term_End_Date__c==null && oli.Contract_Terms__c==null){
                    oli.arr__c = (oli.UnitPrice * oli.Quantity);
                    //system.debug('OppLineItemBeforeUpdate(debug2) oli.arr__c = (oli.UnitPrice * oli.Quantity);');
                }
                //else "if both (term dates) are populated, it will calculate from the term dates"
                else if (oli.Term_Start_Date__c!=null && oli.Term_End_Date__c!=null){ //note a ValidationRule enforces end>start
                    //stepOne = oli.Term_Start_Date__c.monthsBetween(oli.Term_End_Date__c.addDays(1));
                    stepOne = getWholeMonthsBetweenTwoDatesAsDecimal(oli.Term_Start_Date__c,oli.Term_End_Date__c).intValue();
                    stepTwo = oli.Term_Start_Date__c.addMonths(stepOne).addDays(-1);
                    stepThree  = math.abs(oli.Term_End_Date__c.daysBetween(stepTwo));
                    //System.debug('temp debug, Date.daysInMonth(oli.Term_End_Date__c.Year(), oli.Term_End_Date__c.Month()); --> '+Date.daysInMonth(oli.Term_End_Date__c.Year(), oli.Term_End_Date__c.Month()));
                    
                    //Inaccurate Requirements for stepFour variable calculation Noticed on 2021-04-14: Attn Krzys, Ive spotted a bug in the google sheet as well for you to please fix: The google sheet doesnt handle leap year, so is wrong sometimes.  For example google sheet's step 4 uses bad data in the following example because it doesnt handle leap year.  Example: Aug 18 2021 to Feb/24/2024 whereby the sheet incorrectly calculates step four as 0.25  because it thinks 28 days in Feb.  However thats wrong because Feb 2024 has 29 days.  SFDC uses 29 because it handles for leapyear in this step.  Please update the sheet or expectations accordingly because i assume sfdc is more accurate w/r/t leapyear..
                    stepFour = (Double)stepThree / (Date.daysInMonth(oli.Term_End_Date__c.Year(), oli.Term_End_Date__c.Month()));//Integer division in apex drops the remainder;  can find it again with the math.mod function, or an effective alternate solution is to explicitly convert one of the values in the division expression to a Double before the division operation is performed.
                    
                    stepFive = stepOne + stepFour;
                    system.debug('OppLineItemBeforeUpdate(debug: stepOne=)'+stepOne);
                    system.debug('OppLineItemBeforeUpdate(debug: stepTwo=)'+stepTwo);
                    system.debug('OppLineItemBeforeUpdate(debug: stepThree=)'+stepThree);
                    system.debug('OppLineItemBeforeUpdate(debug: stepFour=)'+stepFour);
                    system.debug('OppLineItemBeforeUpdate(debug: stepFive=)'+stepFive);
                    oli.arr__c = (  (oli.UnitPrice * oli.Quantity) / stepFive        )*12;
                } 
                //else "if we have have Term Dates but not Contract Months then calculate from the (validated) term dates"
                else if (oli.Term_Start_Date__c!=null && oli.Term_End_Date__c!=null && (oli.Contract_Terms__c==null ||oli.Contract_Terms__c==0)){
                    //stepOne = oli.Term_Start_Date__c.monthsBetween(oli.Term_End_Date__c.addDays(1));
                    stepOne = getWholeMonthsBetweenTwoDatesAsDecimal(oli.Term_Start_Date__c,oli.Term_End_Date__c).intValue();
                    stepTwo = oli.Term_Start_Date__c.addMonths(stepOne).addDays(-1);
                    stepThree  = math.abs(oli.Term_End_Date__c.daysBetween(stepTwo));
                    
                    //Inaccurate Requirements for stepFour variable calculation Noticed on 2021-04-14: Attn Krzys, Ive spotted a bug in the google sheet as well for you to please fix: The google sheet doesnt handle leap year, so is wrong sometimes.  For example google sheet's step 4 uses bad data in the following example because it doesnt handle leap year.  Example: Aug 18 2021 to Feb/24/2024 whereby the sheet incorrectly calculates step four as 0.25  because it thinks 28 days in Feb.  However thats wrong because Feb 2024 has 29 days.  SFDC uses 29 because it handles for leapyear in this step.  Please update the sheet or expectations accordingly because i assume sfdc is more accurate w/r/t leapyear..
                    stepFour = (Double)stepThree / (Date.daysInMonth(oli.Term_End_Date__c.Year(), oli.Term_End_Date__c.Month()));//Integer division in apex drops the remainder;  can find it again with the math.mod function, or an effective alternate solution is to explicitly convert one of the values in the division expression to a Double before the division operation is performed.
                    
                    stepFive = stepOne + stepFour;
                    system.debug('OppLineItemBeforeUpdate(debug: stepOne=)'+stepOne);
                    system.debug('OppLineItemBeforeUpdate(debug: stepTwo=)'+stepTwo);
                    system.debug('OppLineItemBeforeUpdate(debug: stepThree=)'+stepThree);
                    system.debug('OppLineItemBeforeUpdate(debug: stepFour=)'+stepFour);
                    system.debug('OppLineItemBeforeUpdate(debug: stepFive=)'+stepFive);
                    oli.arr__c = (  (oli.UnitPrice * oli.Quantity) / stepFive        )*12;
                }
                //else fallback to $0.0
                else if (opportunities.get(oli.OpportunityId).StageName!='Finance Review' && opportunities.get(oli.OpportunityId).StageName!='Sales Ops Review'){oli.arr__c=0;
                    //system.debug('OppLineItemBeforeUpdate(debug9) oli.arr__c=0;');
                }
                else{oli.arr__c=0;
                    //system.debug('OppLineItemBeforeUpdate(debug10) oli.arr__c=0;');
                }
            //Scenario: Using SOPS_Override_ARR_Calc_for_PipeLTE98__c  
            } else if (oli.Subscription__c && !opportunities.get(oli.OpportunityId).IsWon && !opportunities.get(oli.OpportunityId).IsClosed && opportunities.get(oli.OpportunityId).StageName!='Finance Review' && oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c!=null){ //There's a SOPS_Override_ARR_Calc_for_PipeLTE98__c  ! Therefore IF  <same condition as ARR Calc  + SOPS_Override_ARR_Calc_for_PipeLTE98__c>  THEN we use it!
                oli.arr__c = oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c;
                //system.debug('OppLineItemBeforeUpdate(debug11) oli.arr__c = oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c;');//There's a SOPS_Override_ARR_Calc_for_PipeLTE98__c  ! Therefore IF  <same condition as ARR Calc  + SOPS_Override_ARR_Calc_for_PipeLTE98__c>  THEN we use it!
            }

            //This checks to see if there was a value set in a previous trigger run
            decimal oldARRConsidersPreviousTriggerRuns = (oldARRMap.containsKey(oli.id)) ? oldARRMap.get(oli.id) : oldMap.get(oli.id).ARR__c; //boolean oldIsWon --> decimal oldARRConsidersPreviousTriggerRuns // boilerplated from //boolean oldIsWon = (oldIsWonMap.containsKey(oli.id)) ? oldIsWonMap.get(oli.id) : oldmap.get(oli.id).isWon;
        
            //this checks the current opp value with the 'correct' old value
            if(oli.ARR__c != oldARRConsidersPreviousTriggerRuns){
                justChangedOppLineARRMap.put(oli.Id, oli);}
        
            //this puts in the 'correct' old value in case the trigger is run again in the same context
            if(oldARRConsidersPreviousTriggerRuns != oli.ARR__c) {
                oldARRMap.put(oli.id,oli.ARR__c);}
        }

        List<OpportunityLineItemCustomFieldHistory__c> oliCustomHistoriesToInsertList = new List<OpportunityLineItemCustomFieldHistory__c>();
            for (OpportunityLineItem oli : justChangedOppLineARRMap.values()){
                   //System.debug('@@debug: OpportunityLineItem after update'); //because of context
                   OpportunityLineItem oldOppLine = oldMap.get(oli.Id);
                   OpportunityLineItem newOppLine = newMap.get(oli.Id);     
                   oliCustomHistoriesToInsertList.add(new OpportunityLineItemCustomFieldHistory__c(OpportunityLineItem_Record_Id__c = newOppLine.Id,
                   Object_Name__c = 'OpportunityLineItem',
                   Field_Name__c = 'ARR__c',
                   Previous_Value__c = oldOppLine.ARR__c,
                   Current_Value__c = newOppLine.SOPS_Override_ARR_Calc_for_PipeLTE98__c ==null? newOppLine.ARR__c : newOppLine.SOPS_Override_ARR_Calc_for_PipeLTE98__c,
                   developer_note__c = newOppLine.SOPS_Override_ARR_Calc_for_PipeLTE98__c ==null? 'called from before update without oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c' : 'called from before update WITH/USING oli.SOPS_Override_ARR_Calc_for_PipeLTE98__c', //because of context
                   Modified_Date_Time__c = System.now(),
                   Modified_By__c = UserInfo.getUserId(),
                   OpportunityId__c=oldOppLine.OpportunityId,
                   OpportunityLookup__c=oldOppLine.OpportunityId
                   ));
                   //System.debug('@@###debug: OpportunityLineItem ...... oliCustomHistoriesToInsertList.size() == '+oliCustomHistoriesToInsertList.size());
            }
           if(!oliCustomHistoriesToInsertList.isEmpty()) {try {
               //insert histories
               insert oliCustomHistoriesToInsertList;} catch (Exception e) {
               //System.debug('@@Error############ in_opportunitylineitem_contexts_to_track_ARR_field_history_as_a_workaround_for_sfdc_ga_limitation_ideaview_0873a000000e8ccqas): ' + e);
            }}        
        //END ARR CALC, SERIES
            
    }

    //start mondaycall
    public static void populateProduct(){
        Set<String> productTypes = new Set<String>();
        Set<String> opportunityIds = new Set<String>();
        
        for( OpportunityLineItem oppLine : newOpportunityLines ){
            if( oppLine.Product_Type__c != Null ) {
                productTypes.add( oppLine.ProductType__c );
            }
            if( oppLine.Opportunity_ID__c != Null ) {
                opportunityIds.add( oppLine.Opportunity_ID__c );
            }
            if( oppLine.Quantity == Null ) {
                oppLine.Quantity = 1;
            }
            oppLine.UnitPrice =  oppLine.RLI_Amount__c != Null ? oppLine.RLI_Amount__c : oppLine.UnitPrice;
        }
        
        Map<String, PricebookEntry> mapProductTypeToPriceBookEntry = new Map<String, PricebookEntry>();
        for( PricebookEntry pbEntry : [ SELECT Id, Product2.Name, CurrencyIsoCode 
                                        FROM PricebookEntry 
                                        WHERE Product2.Name IN : productTypes ] ){
            
            if( pbEntry.Product2.Name != null ) {
                String mapKeyForPricebookEntry = pbEntry.CurrencyIsoCode + '_' + pbEntry.Product2.Name.toLowerCase(); 
                mapProductTypeToPriceBookEntry.put( mapKeyForPricebookEntry, pbEntry );
            }
            
        }
        
        Map<String, Opportunity> mapOppIdToOpportunity = new Map<String, Opportunity>();
        for( Opportunity opp : [ SELECT Id, Sugar_ID__c, CurrencyIsoCode FROM Opportunity 
                                 WHERE Sugar_ID__c IN : opportunityIds ] ){
            mapOppIdToOpportunity.put( opp.Sugar_ID__c, opp );
            
        }
        //system.debug( ' ******* mapProductTypeToPriceBookEntry ' + mapProductTypeToPriceBookEntry );
        for( OpportunityLineItem oppLine : newOpportunityLines ){
            Opportunity opp = new Opportunity();
            if( mapOppIdToOpportunity.containsKey( oppLine.Opportunity_ID__c ) ) {
                opp = mapOppIdToOpportunity.get( oppLine.Opportunity_ID__c );
                oppLine.OpportunityId = opp.Id;
            }
            //system.debug( opp + ' ******* oppLine ' + oppLine );
            if( opp.Id != null && oppLine.ProductType__c != null ) {
                String mapKeyForPricebookEntry = opp.CurrencyIsoCode + '_' + oppLine.ProductType__c.trim().toLowerCase();
                //system.debug( ' ******* mapKeyForPricebookEntry ' + mapKeyForPricebookEntry );
                //system.debug( ' ******* mapKeyForPricebookEntry ' + mapProductTypeToPriceBookEntry.containsKey( mapKeyForPricebookEntry ));
                if( mapProductTypeToPriceBookEntry.containsKey( mapKeyForPricebookEntry )) {
                    oppLine.PricebookEntryId = mapProductTypeToPriceBookEntry.get( mapKeyForPricebookEntry ).Id;
                }
            }
        }
        
    }
    //end mondaycall

    //Start ARR CALC, SERIES
    public static decimal getWholeMonthsBetweenTwoDatesAsDecimal(date startDate, date endDate) {
        /*turns out the apex Date.monthsBetween() method is not that precise!  It seems to round up to the next whole number when assigning the native Date.monthsBetween to an integer, which broke business requirement.
        As such we are going to precisely calculate the difference in months as a decimal, then well meet business requirement by rounding the result (precisely will be the goal)
        */
               
                decimal monthsBetween_asMorePreciseDecimal = 0.0;
                  
                if( startDate.month()== endDate.month() && startDate.year()== endDate.year() )
                {
                    monthsBetween_asMorePreciseDecimal =  decimal.valueOf((startDate.daysBetween(endDate) + 1 ))
                                / decimal.valueOf(date.daysInMonth(startDate.year(),startDate.month()));
                }
                else
                {
                    Integer monthsBetween = startDate.monthsBetween(endDate)-1;
                    System.debug('Int var:'+monthsBetween);
                   
                    decimal firstMonth = decimal.valueOf(date.daysInMonth(startDate.year() , startDate.month())-startDate.day()+1)
                                            / decimal.valueOf(date.daysInMonth(startDate.year(), startDate.month()));

                    System.debug('firstMonth var:'+firstMonth);
                   
                    decimal lastMonth =  decimal.valueOf(endDate.toStartOfMonth().daysBetween(endDate)+1) 
                                              / decimal.valueOf(date.daysInMonth(endDate.year(), endDate.month()));

                    //we are calculating a delta by adding all 3 decimal segments which represent (months between not counting first month,   +  middle segment not counting last month   +  last month) 
                    //as such, its possible when defining start/end dates to define days that are close, (irrespective of year).  For example: 5/3/2021 to 5/2/2022.  In these scenarios our encapsulating function must handle (round to 1) scenarios where first + last equals .99999999 etc.  
                    //For this reason, when firstMonth + lastMonth is within  we will precisely round this up to 1. 
                    //for example using 5/3/2021 to 5/2/2022  the value of firstMonth and lastMonth summed together is 11.9999999999999999999999999999999995
                    //so we can basically handle this scenario by inspecting the digits right of the "." period/decimal,   and if its greater than 0.967741935483871,  just assign it the value of 1 so that our ARR Calc is not minutely incorrect in those scenarios.
                    //the roundiung threshold, gt .967741935483871 accounts for the smallest (1 day) unit ,   (1 -   (1/31))  or also =   (1 - 0.0357142857142857) = 0.9642857142857143.   If the variable is greater than that then round up to 1 beecause thats achieves the result of the google sheet requirements.
                        decimal lastMonth_plus_firstMonth_as_potentiallyRoundedDecimal = firstMonth + lastMonth; // the sum of the two will never exceed 1
                        System.debug(lastMonth_plus_firstMonth_as_potentiallyRoundedDecimal - lastMonth_plus_firstMonth_as_potentiallyRoundedDecimal.round(System.RoundingMode.DOWN)); //this trick returns the stuff to the right of the decimal.
                        if(lastMonth_plus_firstMonth_as_potentiallyRoundedDecimal >.967741935483871){lastMonth_plus_firstMonth_as_potentiallyRoundedDecimal=1;}


                    
                    //lastMonth.setScale(2, roundingMode.DOWN); //experimental, fix march 22 2021 krzys cited bug? Test values in this cell in this sheet: https://docs.google.com/spreadsheets/d/1A7QGDSHXpVuUJ_fN9lgCeMf4hh-gYKZogCVmwKugfx4/edit#gid=1206804717&range=G4
                    //lastMonth.setScale(0, roundingMode.UP); //experimental, fix march 23 2021 krzys cited bug?
                    System.debug('lastMonth var: '+lastMonth);
                   
                    //monthsBetween_asMorePreciseDecimal =  firstMonth + monthsBetween + lastMonth;        
                    monthsBetween_asMorePreciseDecimal =  monthsBetween + lastMonth_plus_firstMonth_as_potentiallyRoundedDecimal;        
                }
               
                
                //System.debug('Monitor Statement by peter.noges@neo4j.com for March2021 ARR Calc RewriteS: rounding would set monthsBetween_asMorePreciseDecimal =: '+monthsBetween_asMorePreciseDecimal.setScale(2, roundingMode.DOWN));
                System.debug('monthsBetween_asMorePreciseDecimal =: '+monthsBetween_asMorePreciseDecimal);
                //return monthsBetween_asMorePreciseDecimal.setScale(2, roundingMode.DOWN);   
                
                return monthsBetween_asMorePreciseDecimal;
            }

    //End ARR CALC, SERIES
}