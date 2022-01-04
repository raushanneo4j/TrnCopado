<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Quote_Contract_Terms_Default_to_Opp_CTs</fullName>
        <field>Contract_Terms_months__c</field>
        <formula>Opportunity.Contract_Terms__c</formula>
        <name>Quote Contract Terms Default to Opp CTs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quote_Expiration_Date</fullName>
        <description>defaults to opp term start date - 1 day, basically previous term&apos;s end date</description>
        <field>ExpirationDate</field>
        <formula>Opportunity.Term_Start_Date__c - 1</formula>
        <name>Quote Expiration Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quote_TE_Date_Default_to_Opp_TE_Date</fullName>
        <field>Term_End_Date__c</field>
        <formula>Opportunity.Term_End_Date__c</formula>
        <name>Quote TE Date Default to Opp TE Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_Name_to_Quote_No_Date</fullName>
        <field>Name</field>
        <formula>QuoteNumber + &quot; - &quot; +  TEXT(TODAY())</formula>
        <name>Update Quote Name to Quote No. + Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Update Quote Upon Creation</fullName>
        <actions>
            <name>Quote_Contract_Terms_Default_to_Opp_CTs</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Quote_Expiration_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Quote_TE_Date_Default_to_Opp_TE_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Quote_Name_to_Quote_No_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Auto-name, Opp Values Defaulted for: Term End, Contract Terms, Expiration Date = Term Start - 1</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
