<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Customer_Account_Name_Changed</fullName>
        <ccEmails>karl-gustav.bergqvist@neo4j.com</ccEmails>
        <description>Customer Account Name Changed</description>
        <protected>false</protected>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Customer_Account_Name_Changes</template>
    </alerts>
    <alerts>
        <fullName>Customer_Account_Revenue_Has_Changed</fullName>
        <description>Customer Account Revenue Has Changed</description>
        <protected>false</protected>
        <recipients>
            <recipient>kenny.huang@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Account_Revenue_Has_Changed</template>
    </alerts>
    <alerts>
        <fullName>Customer_changed_to_Past_Customer</fullName>
        <ccEmails>lance.kaji+jiannas_alert_01W6A000000QJla@neotechnology.com</ccEmails>
        <description>Customer changed to Past Customer ( 2020-03-10 removed jhardt@mondaycall.com)</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Account_Type_Changed_to_Past_Customer</template>
    </alerts>
    <alerts>
        <fullName>New_Account_Created_in_Salesforce</fullName>
        <description>New Account Created in Salesforce</description>
        <protected>false</protected>
        <recipients>
            <recipient>Account_Quality_Assurance_Group</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>nehag@grazitti.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>salesops@neo4j.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/New_Account_Created_in_Salesforce</template>
    </alerts>
    <alerts>
        <fullName>Past_Customer_Alert</fullName>
        <ccEmails>lance.kaji+jiannas_alert_01W6A000000ChSCUA0@neotechnology.com</ccEmails>
        <description>Past Customer Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Past_Customer_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Non_U_S_Regional_Territory</fullName>
        <description>Populates &quot;Regional Territory&quot; field on the Account object based on the formula below.</description>
        <field>RegionalTerritoryAccount__c</field>
        <formula>IF(ISBLANK(ShippingCountry),&quot;None&quot;,
IF(CONTAINS(&quot;Ireland: United Kingdom&quot;, ShippingCountry ), &quot;EMEA - UKI&quot;,
IF(CONTAINS(&quot;France&quot;, ShippingCountry ), &quot;EMEA - France&quot;,
IF(CONTAINS(&quot;Spain:Portugal&quot;, ShippingCountry ), &quot;EMEA - Iberia&quot;,
IF(CONTAINS(&quot;Belgium:Luxembourg:Netherlands&quot;, ShippingCountry ), &quot;EMEA - Benelux&quot;,
IF(CONTAINS(&quot;Austria:Germany: Switzerland&quot;, ShippingCountry ), &quot;EMEA - DACH&quot;,
IF(CONTAINS(&quot;Israel&quot;, ShippingCountry ), &quot;EMEA - Israel&quot;,
IF(CONTAINS(&quot;Italy&quot;, ShippingCountry ), &quot;EMEA - Italy&quot;,
IF(CONTAINS(&quot;Denmark:Iceland:Sweden:Finland:Norway&quot;, ShippingCountry ), &quot;EMEA - Nordics&quot;,
IF(CONTAINS(&quot;China:Taiwan:Hong Kong&quot;, ShippingCountry ), &quot;APAC - Greater China&quot;,
IF(CONTAINS(&quot;Australia:New Zealand&quot;, ShippingCountry ), &quot;APAC - ANZ&quot;,
IF(CONTAINS(&quot;Singapore:Indonesia:Thailand&quot;, ShippingCountry ), &quot;APAC - ASEAN&quot;,
IF(CONTAINS(&quot;India:Malaysia&quot;, ShippingCountry ), &quot;APAC - ASIA&quot;,
&quot;Unassigned&quot;)))))))))))))</formula>
        <name>Update: Non-U.S. Regional Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Prior_Account_Name</fullName>
        <field>Prior_Account_Name__c</field>
        <formula>PRIORVALUE(Name)</formula>
        <name>Update Prior Account Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_U_S_Regional_Territory</fullName>
        <description>Populates &quot;Regional Territory&quot; field on the Account object based on the formula below.</description>
        <field>RegionalTerritoryAccount__c</field>
        <formula>IF(ISBLANK(ShippingState),&quot;None&quot;,
IF(CONTAINS(&quot;Alaska:Hawaii:California:Washington:Oregon:Idaho:Nevada:Arizona:Utah:Wyoming:Montana:Colorado:New Mexico&quot;, ShippingState ), &quot;NA - U.S. - West&quot;,
IF(CONTAINS(&quot;South Dakota:North Dakota:Nebraska:Kansas:Oklahoma:Texas:Louisiana:Arkansas:Missouri:Iowa:Minnesota:Wisconsin:Illinois:Tennessee:Mississippi:Alabama:Michigan:Indiana&quot;, ShippingState ), &quot;NA - U.S. - Central&quot;,
IF(CONTAINS(&quot;Maine:Vermont:New Hampshire:Massachusetts:Connecticut:Pennsylvania:New York:New Jersey:Delaware:Washington DC:Maryland:West Virginia:Virginia:North Carolina:South Carolina:Georgia:Florida:Kentucky:Ohio:Rhode Island:District of Columbia:Puerto Rico&quot;, ShippingState ), &quot;NA - U.S. - East&quot;,
&quot;Unassigned&quot;))))</formula>
        <name>Update: U.S. Regional Territory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_from_Whitespace</fullName>
        <description>Populate &quot;Update from Whitespace&quot; text field with &quot;1&quot;.</description>
        <field>Update_from_Whitespace__c</field>
        <formula>&quot;1&quot;</formula>
        <name>Update from Whitespace</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>%5BAccount%5D Regional Territory - Non-U%2ES%2E</fullName>
        <actions>
            <name>Update_Non_U_S_Regional_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.ShippingCountry</field>
            <operation>notEqual</operation>
            <value>United States</value>
        </criteriaItems>
        <description>Updates &quot;Regional Territory&quot; field on the Account object based on the ShippingCountry field value. JIRA: SFDCSPT-306</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%5BAccount%5D Regional Territory - U%2ES%2E</fullName>
        <actions>
            <name>Update_U_S_Regional_Territory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.ShippingCountry</field>
            <operation>equals</operation>
            <value>United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ShippingState</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates &quot;Regional Territory&quot; field on the Account object based on the ShippingCountry and ShippingState field values. JIRA: SFDCSPT-306</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Customer Account Name Changed %28Email%29</fullName>
        <actions>
            <name>Customer_Account_Name_Changed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( ISPICKVAL(Type, &apos;Customer&apos;), ISCHANGED(Name) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Account Created in Salesforce</fullName>
        <actions>
            <name>New_Account_Created_in_Salesforce</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>When a new Account is created in Salesforce, send an email alert to the users responsible for verifying Account information. JIRA: SFDCSPT-407</description>
        <formula>OR( $Profile.Name &lt;&gt; &quot;System Administrator&quot;,  Imported_from_Whitespace__c = &quot;FALSE&quot; )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Past Customer Alert</fullName>
        <actions>
            <name>Past_Customer_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Past Customer</value>
        </criteriaItems>
        <description>When an account is set to &quot;Past Customer&quot; an email is sent out to select individuals to off board them.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Prior Account Name</fullName>
        <actions>
            <name>Update_Prior_Account_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Name )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update from Whitespace</fullName>
        <actions>
            <name>Update_from_Whitespace</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Populates the &quot;Update from Whitespace&quot; field on the Account to trigger the TBD flow that populates key standard Account fields with D&amp;B Data. JIRA: SFDCSPT-149</description>
        <formula>LastModifiedBy.Email = &apos;automatedclean@00d6a000000winyuaa.ext&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
