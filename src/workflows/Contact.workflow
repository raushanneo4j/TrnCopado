<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Contact_Status_Change_Date</fullName>
        <description>Time stamp Contact Status Change Date.</description>
        <field>Contact_Status_Change_Date__c</field>
        <formula>NOW()</formula>
        <name>Contact Status Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Email_Secondary_Field</fullName>
        <description>Populate &apos;Email (Secondary)&apos; field with the email address from the &apos;Email&apos; field.</description>
        <field>Email_Secondary__c</field>
        <formula>Email</formula>
        <name>Populate &apos;Email (Secondary)&apos; Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Non_U_S_Regional_Territory</fullName>
        <description>Populates &quot;Regional Territory&quot; field on the Contact object based on the formula below.</description>
        <field>RegionalTerritoryContact__c</field>
        <formula>IF(ISBLANK(MailingCountry),&quot;None&quot;,
IF(CONTAINS(&quot;Ireland: United Kingdom&quot;, MailingCountry ), &quot;EMEA - UKI&quot;,
IF(CONTAINS(&quot;France&quot;, MailingCountry ), &quot;EMEA - France&quot;,
IF(CONTAINS(&quot;Spain:Portugal&quot;, MailingCountry ), &quot;EMEA - Iberia&quot;,
IF(CONTAINS(&quot;Belgium:Luxembourg:Netherlands&quot;, MailingCountry ), &quot;EMEA - Benelux&quot;,
IF(CONTAINS(&quot;Austria:Germany: Switzerland&quot;, MailingCountry ), &quot;EMEA - DACH&quot;,
IF(CONTAINS(&quot;Israel&quot;, MailingCountry ), &quot;EMEA - Israel&quot;,
IF(CONTAINS(&quot;Italy&quot;, MailingCountry ), &quot;EMEA - Italy&quot;,
IF(CONTAINS(&quot;Denmark:Iceland:Sweden:Finland:Norway&quot;, MailingCountry ), &quot;EMEA - Nordics&quot;,
IF(CONTAINS(&quot;China:Taiwan:Hong Kong&quot;, MailingCountry ), &quot;APAC - Greater China&quot;,
IF(CONTAINS(&quot;Australia:New Zealand&quot;, MailingCountry ), &quot;APAC - ANZ&quot;,
IF(CONTAINS(&quot;Singapore:Indonesia:Thailand&quot;, MailingCountry ), &quot;APAC - ASEAN&quot;,
IF(CONTAINS(&quot;India:Malaysia&quot;, MailingCountry ), &quot;APAC - ASIA&quot;,
&quot;Unassigned&quot;)))))))))))))</formula>
        <name>Update: Non-U.S. Regional Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_U_S_Regional_Territory</fullName>
        <description>Populates &quot;Regional Territory&quot; field on the Contact object based on the formula below.</description>
        <field>RegionalTerritoryContact__c</field>
        <formula>IF(ISBLANK(MailingState), &quot;None&quot;,
IF(CONTAINS(&quot;Alaska:Hawaii:California:Washington:Oregon:Idaho:Nevada:Arizona:Utah:Wyoming:Montana:Colorado:New Mexico&quot;, MailingState ), &quot;NA - U.S. - West&quot;,
IF(CONTAINS(&quot;South Dakota:North Dakota:Nebraska:Kansas:Oklahoma:Texas:Louisiana:Arkansas:Missouri:Iowa:Minnesota:Wisconsin:Illinois:Tennessee:Mississippi:Alabama:Michigan:Indiana&quot;, MailingState ), &quot;NA - U.S. - Central&quot;,
IF(CONTAINS(&quot;Maine:Vermont:New Hampshire:Massachusetts:Connecticut:Pennsylvania:New York:New Jersey:Delaware:Washington DC:Maryland:West Virginia:Virginia:North Carolina:South Carolina:Georgia:Florida:Kentucky:Ohio:Rhode Island:District of Columbia:Puerto Rico&quot;, MailingState ), &quot;NA - U.S. - East&quot;,
&quot;Unassigned&quot;))))</formula>
        <name>Update: U.S. Regional Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>%5BContact%5D Regional Territory - Non-U%2ES%2E</fullName>
        <actions>
            <name>Update_Non_U_S_Regional_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.MailingCountry</field>
            <operation>notEqual</operation>
            <value>United States</value>
        </criteriaItems>
        <description>Updates &quot;Regional Territory&quot; field on the Contact object based on the MailingCountry field value. JIRA: SFDCSPT-306</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BContact%5D Regional Territory - U%2ES%2E</fullName>
        <actions>
            <name>Update_U_S_Regional_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.MailingCountry</field>
            <operation>equals</operation>
            <value>United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MailingState</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates &quot;Regional Territory&quot; field on the Contact object based on the MailingCountry and MailingState field values. JIRA: SFDCSPT-306</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate %27Email %28Secondary%29%27 Field</fullName>
        <actions>
            <name>Populate_Email_Secondary_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When the &apos;Email&apos; field is populated on a Contact record, populate the &apos;Email (Secondary)&apos; field, if blank, with the same address. JIRA: SFDCSPT-194</description>
        <formula>ISBLANK(Email_Secondary__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Time Stamp Contact Status Change Date</fullName>
        <actions>
            <name>Contact_Status_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This rule time stamps the &quot;Contact Status Change Date&quot; field whenever the field is updated. JIRA: SFDCSPT-163</description>
        <formula>ISCHANGED(Contact_Status__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
