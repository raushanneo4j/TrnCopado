<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>PSA_Community_Resource_Request_Alert</fullName>
        <description>PSA Community Resource Request Alert JIRA: SFDCSPT-700</description>
        <protected>false</protected>
        <recipients>
            <field>PMO_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply@neotechnology.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>PSA_Email_Templates/PSA_Community_Resource_Request_Alert</template>
    </alerts>
    <alerts>
        <fullName>PSA_New_Resource_Request_Email_Alert</fullName>
        <description>PSA New Resource Request Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PSA_Email_Templates/PSA_New_Resource_Request</template>
    </alerts>
    <fieldUpdates>
        <fullName>PSA_RRUpdateCostRatefromSugCostRate</fullName>
        <field>pse__Average_Cost_Rate_Number__c</field>
        <formula>pse__Rate_Card__r.pse__Average_Cost_Rate__c</formula>
        <name>PSA RRUpdateCostRatefromSugCostRate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_RR_Bill_Rate_From_Rate_Card</fullName>
        <field>pse__Requested_Bill_Rate__c</field>
        <formula>pse__Suggested_Bill_Rate_Number__c</formula>
        <name>PSA RR Bill Rate From Rate Card</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_RR_Status_Hold</fullName>
        <field>pse__Status__c</field>
        <literalValue>Hold</literalValue>
        <name>PSA RR Status Hold</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_RR_Status_Ready_To_Staff</fullName>
        <field>pse__Status__c</field>
        <literalValue>Ready to Staff</literalValue>
        <name>PSA RR Status Ready To Staff</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Requested_Bill_Rate_0</fullName>
        <field>pse__Requested_Bill_Rate__c</field>
        <formula>0</formula>
        <name>PSA Requested Bill Rate = 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Set_Eligible_for_Schedule_Recalculat</fullName>
        <field>pse__Eligible_for_Schedule_Recalculation__c</field>
        <literalValue>1</literalValue>
        <name>PSA Set Eligible for Schedule Recalculat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Set_RR_Name</fullName>
        <field>pse__Resource_Request_Name__c</field>
        <formula>IF( pse__Resource_Held__c = TRUE,Name + &quot; - &quot; + pse__Staffer_Resource__r.psa_report__Resource_Name__c + &quot; - &quot; + TEXT(pse__Resource_Role__c) + &quot; - &quot; + TEXT(pse__Status__c),Name + &quot; - &quot; + TEXT(pse__Resource_Role__c) + &quot; - &quot; + TEXT(pse__Status__c))</formula>
        <name>PSA Set RR Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>PSA Resource Held on Resource Request</fullName>
        <actions>
            <name>PSA_RR_Status_Hold</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Set_RR_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>pse__Resource_Request__c.pse__Resource_Held__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Resource Held on Request</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PSA Resource Request Created</fullName>
        <actions>
            <name>PSA_RR_Status_Ready_To_Staff</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>PSA_Set_Eligible_for_Schedule_Recalculat</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Resource Request Defaults</description>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PSA Resource Request T%26M From Rate Card</fullName>
        <actions>
            <name>PSA_RR_Bill_Rate_From_Rate_Card</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Bill Rate From Rate Card</description>
        <formula>NOT(ISBLANK(pse__Project__c)) &amp;&amp; NOT(ISPICKVAL(pse__Project__r.pse__Billing_Type__c, &apos;Fixed Price&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PSA Set RR Bill Rate to 0 for Fixed Price Projects</fullName>
        <actions>
            <name>PSA_Requested_Bill_Rate_0</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>$0 Bill Rate for Fixed Price Projects</description>
        <formula>ISPICKVAL(pse__Project__r.pse__Billing_Type__c, &apos;Fixed Price&apos;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
