<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>PSA_PM_Assigned_Email_Alert</fullName>
        <description>PSA PM Assigned Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>pse__Project_Manager__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PSA_Email_Templates/PSA_PM_Assigned</template>
    </alerts>
    <fieldUpdates>
        <fullName>PSA_Daily_Timecard_Notes_Required</fullName>
        <field>pse__Daily_Timecard_Notes_Required__c</field>
        <literalValue>1</literalValue>
        <name>PSA Daily Timecard Notes Required</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Project_Active_False</fullName>
        <field>pse__Is_Active__c</field>
        <literalValue>0</literalValue>
        <name>PSA Project Active False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Project_Active_True</fullName>
        <field>pse__Is_Active__c</field>
        <literalValue>1</literalValue>
        <name>PSA Project Active True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Project_Closed_For_Expense_Entry</fullName>
        <field>pse__Closed_for_Expense_Entry__c</field>
        <literalValue>1</literalValue>
        <name>PSA Project Closed For Expense Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Project_Closed_For_Time_Entry</fullName>
        <field>pse__Closed_for_Time_Entry__c</field>
        <literalValue>1</literalValue>
        <name>PSA Project Closed For Time Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Unset_Closed_For_Expense_Entry</fullName>
        <field>pse__Closed_for_Expense_Entry__c</field>
        <literalValue>0</literalValue>
        <name>PSA Unset Closed For Expense Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Unset_Project_Closed_For_Time_Entry</fullName>
        <field>pse__Closed_for_Time_Entry__c</field>
        <literalValue>0</literalValue>
        <name>PSA Unset Project Closed For Time Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Update_Project_Current_Time_Period</fullName>
        <field>pse__Action_Update_Current_Time_Period__c</field>
        <literalValue>1</literalValue>
        <name>PSA Update Project Current Time Period</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>PSA Billable Project Defaults On Create</fullName>
        <actions>
            <name>PSA_PM_Assigned_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>PSA_Daily_Timecard_Notes_Required</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Project_Active_True</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Update_Project_Current_Time_Period</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Triggers when a new Billable Project is Created</description>
        <formula>pse__Is_Billable__c = TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PSA Project Activation based on Stage</fullName>
        <actions>
            <name>PSA_Project_Active_True</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Unset_Closed_For_Expense_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Unset_Project_Closed_For_Time_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Reactivate Project when changed from Cancelled or Completed</description>
        <formula>NOT(  ISPICKVAL(pse__Stage__c,&quot;Completed&quot;) ||  ISPICKVAL(pse__Stage__c,&quot;Canceled&quot;) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PSA Project Closure Based on Stage</fullName>
        <actions>
            <name>PSA_Project_Active_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Project_Closed_For_Expense_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Project_Closed_For_Time_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Triggers when A Project Stage is changed to Completed to Canceled</description>
        <formula>ISPICKVAL(pse__Stage__c,&quot;Completed&quot;) ||  ISPICKVAL(pse__Stage__c,&quot;Canceled&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PSA Project PM Changed</fullName>
        <actions>
            <name>PSA_PM_Assigned_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Triggers when the Project PM has been changed</description>
        <formula>(ISNEW() || ISCHANGED( pse__Project_Manager__c )) &amp;&amp;   (pse__Project_Manager__r.pse__Salesforce_User__r.Id &lt;&gt; OwnerId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
