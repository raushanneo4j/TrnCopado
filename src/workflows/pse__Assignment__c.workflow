<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>PSA_Assigned_To_Project_Email_Alert</fullName>
        <description>PSA Assigned To Project Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>pse__Resource__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PSA_Email_Templates/PSA_Resource_Assigned_To_Project</template>
    </alerts>
    <fieldUpdates>
        <fullName>PSA_Assignment_Bill_Rate_0</fullName>
        <field>pse__Bill_Rate__c</field>
        <formula>0</formula>
        <name>PSA Assignment Bill Rate $0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Assignment_Billable_True</fullName>
        <field>pse__Is_Billable__c</field>
        <literalValue>1</literalValue>
        <name>PSA Assignment Billable True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Default_Assignment_Name</fullName>
        <field>Name</field>
        <formula>LEFT(pse__Project__r.Name &amp; &quot; - &quot; &amp;  pse__Resource__r.FirstName  &amp; &apos; &apos; &amp;  pse__Resource__r.LastName  , 80)</formula>
        <name>PSA Default Assignment Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Set_Assignment_Status_to_Scheduled</fullName>
        <description>Sets Assignment Status to Scheduled</description>
        <field>pse__Status__c</field>
        <literalValue>Scheduled</literalValue>
        <name>PSA Set Assignment Status to Scheduled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Update_Average_Cost_Rate</fullName>
        <field>pse__Cost_Rate_Amount__c</field>
        <formula>pse__Average_Cost_Rate_Number__c</formula>
        <name>PSA Update Average Cost Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Update_Bill_Rate_Rate_Card</fullName>
        <field>pse__Bill_Rate__c</field>
        <formula>pse__Suggested_Bill_Rate_Number__c</formula>
        <name>PSA Update Bill Rate Rate Card</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Use_Default_Cost_Rate_False</fullName>
        <field>pse__Use_Resource_Default_Cost_Rate__c</field>
        <literalValue>0</literalValue>
        <name>PSA Use Default Cost Rate False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>PSA Assignment %240 Biill Rate Fixed Price</fullName>
        <actions>
            <name>PSA_Assignment_Bill_Rate_0</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Assignment_Billable_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Defaults Assignment to Billable with $0 Bill Rate For Fixed Price Projects</description>
        <formula>pse__Project__r.pse__Is_Billable__c = TRUE &amp;&amp; ISPICKVAL(pse__Project__r.pse__Billing_Type__c, &apos;Fixed Price&apos;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PSA Assignment Creation Defaults</fullName>
        <actions>
            <name>PSA_Assigned_To_Project_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>PSA_Default_Assignment_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Set_Assignment_Status_to_Scheduled</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Use_Default_Cost_Rate_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Defaults on every Assignment Creation</description>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PSA Assignment Set Bill Rate from Rate Card For Non-Fixed Price Projects</fullName>
        <actions>
            <name>PSA_Update_Bill_Rate_Rate_Card</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>PSA Assignment Set Bill Rate from Rate Card For Non-Fixed Price</description>
        <formula>pse__Project__r.pse__Is_Billable__c = TRUE &amp;&amp; NOT(ISPICKVAL(pse__Project__r.pse__Billing_Type__c, &apos;Fixed Price&apos;)) &amp;&amp; pse__Is_Billable__c &amp;&amp; Not(ISBLANK(pse__Rate_Card__c))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PSA Set Assignment Cost Rate From Rate Card</fullName>
        <actions>
            <name>PSA_Update_Average_Cost_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sets Assignment Cost Rate From Rate Card</description>
        <formula>Not(ISBLANK(pse__Rate_Card__c))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
