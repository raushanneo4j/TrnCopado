<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>If_Azure_is_tagged_in_Partner_Involved_Then_Alert_Logan_Smith</fullName>
        <ccEmails>peter.noges+featuremonitor@neo4j.com</ccEmails>
        <description>If Azure is tagged in Partner Involved Then Alert Logan Smith</description>
        <protected>false</protected>
        <recipients>
            <recipient>logan.smith@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply@neotechnology.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Team/If_Azure_is_tagged_in_Partner_Involved_Then_Alert_Logan_Smith</template>
    </alerts>
    <fieldUpdates>
        <fullName>UniqueCombokey_fulfillmentAcctId_OppId</fullName>
        <field>UniqueCombokey_fulfillmentAcctId_OppId__c</field>
        <formula>if( 
AND(
TEXT(Partner_Role__c)==&apos;Fulfillment&apos;,
NOT(ISBLANK( Partner_Involved_Account__c)),
NOT(ISBLANK( Opportunity__c))
),

 CASESAFEID(Partner_Involved_Account__c)+CASESAFEID(Opportunity__c) ,null


 )</formula>
        <name>UniqueCombokey_fulfillmentAcctId_OppId</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>If Azure is tagged Then Alert Logan</fullName>
        <actions>
            <name>If_Azure_is_tagged_in_Partner_Involved_Then_Alert_Logan_Smith</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Logan Smith asked for this</description>
        <formula>OR(
  CONTAINS(Partner_Involved_Account__r.Name, &quot;Azure&quot;) ,
  CONTAINS( Partner_Contact__r.Account.Name , &quot;Azure&quot;) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>UniqueCombokey_fulfillmentAcctId_OppId</fullName>
        <actions>
            <name>UniqueCombokey_fulfillmentAcctId_OppId</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(  	AND( 		isnew(),TEXT(Partner_Role__c)==&apos;Fulfillment&apos;, 		not(isblank(Partner_Involved_Account__c )), 		not(isblank(Opportunity__c )) 	),  	and( 		ischanged(Partner_Role__c ), 		OR( 			PRIORVALUE(Partner_Role__c)==&quot;Fulfillment&quot;, 			TEXT(Partner_Role__c)==&quot;Fulfillment&quot;) 	),  	ischanged(Partner_Involved_Account__c),  	ischanged(Opportunity__c)   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
