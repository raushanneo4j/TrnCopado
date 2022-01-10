<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>PSA_Missing_Timecard_Email_Alert</fullName>
        <description>PSA Missing Timecard Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>pse__Resource__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>PSA_Email_Templates/PSA_Missing_Timecard</template>
    </alerts>
    <rules>
        <fullName>PSA Missing Timecard Created</fullName>
        <actions>
            <name>PSA_Missing_Timecard_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>pse__Missing_Timecard__c.pse__Date_Timecard_Entered__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Missing Timecard trigger on record creation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
