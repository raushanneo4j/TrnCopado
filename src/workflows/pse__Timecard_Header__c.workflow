<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>PSA_Timecard_Rejected_Email_Alert</fullName>
        <description>PSA Timecard Rejected Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>pse__Resource__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PSA_Email_Templates/PSA_Timecard_Rejected</template>
    </alerts>
    <fieldUpdates>
        <fullName>PSA_Set_Submitted_Flag_To_True</fullName>
        <field>pse__Submitted__c</field>
        <literalValue>1</literalValue>
        <name>PSA Set Submitted Flag To True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_Approved_False</fullName>
        <field>pse__Approved__c</field>
        <literalValue>0</literalValue>
        <name>PSA Timecard Approved False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_Approved_True</fullName>
        <field>pse__Approved__c</field>
        <literalValue>1</literalValue>
        <name>PSA Timecard Approved True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_IFF_False</fullName>
        <field>pse__Include_In_Financials__c</field>
        <literalValue>0</literalValue>
        <name>PSA Timecard IFF False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_IFF_True</fullName>
        <field>pse__Include_In_Financials__c</field>
        <literalValue>1</literalValue>
        <name>PSA Timecard IFF True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_Status_Approved</fullName>
        <field>pse__Status__c</field>
        <literalValue>Approved</literalValue>
        <name>PSA Timecard Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_Status_Rejected</fullName>
        <field>pse__Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>PSA Timecard Status Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_Status_Saved</fullName>
        <field>pse__Status__c</field>
        <literalValue>Saved</literalValue>
        <name>PSA Timecard Status Saved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Timecard_Submitted_False</fullName>
        <field>pse__Submitted__c</field>
        <literalValue>0</literalValue>
        <name>PSA Timecard Submitted False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>pse__NotifySlack_Timecard_Approval</fullName>
        <apiVersion>46.0</apiVersion>
        <endpointUrl>https://api-gateway.services.financialforce.com/api/salesforce/v1.0/approval</endpointUrl>
        <fields>Id</fields>
        <fields>OwnerId</fields>
        <fields>pse__End_Date__c</fields>
        <fields>pse__Project__c</fields>
        <fields>pse__Resource__c</fields>
        <fields>pse__Start_Date__c</fields>
        <fields>pse__Total_Hours__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>neo4jffonboarding.logins@financialforce.com</integrationUser>
        <name>Notify Slack - Timecard - Approval</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>PSA Approval Process Set Submitted Flag when Timecard Submitted</fullName>
        <actions>
            <name>PSA_Set_Submitted_Flag_To_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>pse__Timecard_Header__c.pse__Status__c</field>
            <operation>equals</operation>
            <value>Submitted</value>
        </criteriaItems>
        <description>Kicks off Timecard Approval Process</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
