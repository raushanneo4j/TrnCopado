<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>PSA_Budget_Name</fullName>
        <field>Name</field>
        <formula>LEFT(pse__Project__r.Name, 73) + &quot;-Budget&quot;</formula>
        <name>PSA Budget Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Budget_Status_Approved</fullName>
        <field>pse__Status__c</field>
        <literalValue>Approved</literalValue>
        <name>PSA Budget Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Exclude_Budget_From_Billing_True</fullName>
        <field>pse__Exclude_from_Billing__c</field>
        <literalValue>1</literalValue>
        <name>PSA Exclude Budget From Billing True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Set_Approved_Flag</fullName>
        <field>pse__Approved__c</field>
        <literalValue>1</literalValue>
        <name>PSA Set Approved Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Set_IFF_on_Budget</fullName>
        <field>pse__Include_In_Financials__c</field>
        <literalValue>1</literalValue>
        <name>PSA Set IFF on Budget</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>PSA Budget Defaults on Create</fullName>
        <actions>
            <name>PSA_Budget_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Budget_Status_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Budget Defaults</description>
        <formula>ISPICKVAL( pse__Type__c, &apos;Customer Purchase Order&apos;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PSA Budget Status Approved - Non-Pre Bill</fullName>
        <actions>
            <name>PSA_Exclude_Budget_From_Billing_True</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Set_Approved_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Set_IFF_on_Budget</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Triggers that occur when Budget is Set to Approved for non pre-bill budgets</description>
        <formula>Ispickval(pse__Status__c,&apos;Approved&apos;) &amp;&amp; ISBLANK( pse__Pre_Billed_Amount__c )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PSA Budget Status Approved - Pre Bill</fullName>
        <actions>
            <name>PSA_Set_Approved_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Set_IFF_on_Budget</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Triggers that occur when Budget is Set to Approved for Pre-Bills</description>
        <formula>Ispickval(pse__Status__c,&apos;Approved&apos;) &amp;&amp; NOT(ISBLANK( pse__Pre_Billed_Amount__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
