<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Product_Created_on_Opportunity_Neo4j_Aura</fullName>
        <description>Product Created on Opportunity: &quot;Neo4j - Aura&quot;</description>
        <protected>false</protected>
        <recipients>
            <recipient>chandler.kaaa@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kay.nair@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sumeet.toprani@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Neo4j_Aura_Product_Created_on_Opportunity</template>
    </alerts>
    <alerts>
        <fullName>Product_Created_on_Opportunity_New_PS_Products_Dec_2020_AMERICAS</fullName>
        <description>Product Created on Opportunity: &quot;New PS Products (Dec 2020)&quot; - AMERICAS</description>
        <protected>false</protected>
        <recipients>
            <recipient>ken.kane@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Product_Created_on_Opportunity</template>
    </alerts>
    <alerts>
        <fullName>Product_Created_on_Opportunity_New_PS_Products_Dec_2020_EMEA</fullName>
        <description>Product Created on Opportunity: &quot;New PS Products (Dec 2020)&quot; - EMEA</description>
        <protected>false</protected>
        <recipients>
            <recipient>jan.aertsen@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Product_Created_on_Opportunity</template>
    </alerts>
    <alerts>
        <fullName>Product_Created_on_Opportunity_Subscription_Agile_Solutions</fullName>
        <description>Product Created on Opportunity: &quot;Subscription - Agile Solutions&quot;</description>
        <protected>false</protected>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>navneet.mathur@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Product_Created_on_Opportunity</template>
    </alerts>
    <alerts>
        <fullName>Product_Created_on_Opportunity_Support_XSP_Extended_Plan</fullName>
        <description>Product Created on Opportunity: &quot;Support - XSP (Extended Plan)&quot;</description>
        <protected>false</protected>
        <recipients>
            <recipient>daniel.terlizzi@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Product_Created_on_Opportunity</template>
    </alerts>
    <alerts>
        <fullName>Support_Notification_Email_For_Trello_Board_New_Only</fullName>
        <ccEmails>davidgordon21+xaybbf7ytpfhgcdfic2o@boards.trello.com,</ccEmails>
        <ccEmails>customer-success@neotechnology.com</ccEmails>
        <description>Support Notification Email For Trello Board (New Only)</description>
        <protected>false</protected>
        <recipients>
            <recipient>christine.shaw@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.gordon@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Customer_Success_Templates/Support_Onboarding_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Always_set_apex_bypass_false</fullName>
        <description>WFRFU may go away, so what declarative options allow the reset of bypass flags? The Idea has 13,220 Points on https://trailblazer.salesforce.com/ideaView?id=0873A000000lEZbQAM meanwhile it takes WFRFU or Apex to achieve. We use WFRFU bc they skip VRs</description>
        <field>neo4j_apexBypass_context__c</field>
        <literalValue>0</literalValue>
        <name>Always set apex bypass false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Is_service_to_PS</fullName>
        <description>This help us to mark &quot;is services&quot; in a product when is &quot;professional services&quot; to be able to run services forecasting.</description>
        <field>pse__IsServicesProductLine__c</field>
        <literalValue>1</literalValue>
        <name>Is Service to PS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Set_IsServices_Flag_On_Opp_Products</fullName>
        <field>pse__IsServicesProductLine__c</field>
        <literalValue>1</literalValue>
        <name>PSA Set IsServices Flag On Opp Products</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Product_Name_to_Product2Name</fullName>
        <field>Product_Name__c</field>
        <formula>if(not(isblank( Product2.Name )),Product2.Name,null)</formula>
        <name>Set Product Name to Product2Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Product_Group</fullName>
        <description>Update the custom &quot;Product Code (Traction)&quot; field on the Opportunity Product object.</description>
        <field>Product_Group_Traction__c</field>
        <formula>TEXT(Product2.Product_Group_Traction__c)</formula>
        <name>Update Product Group</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Subscription_Checkbox</fullName>
        <field>Has_Subscription_Line_Items__c</field>
        <literalValue>1</literalValue>
        <name>Update Subscription Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_parent_pro_services_oppty</fullName>
        <field>Has_Pro_Services_Line_Items__c</field>
        <literalValue>1</literalValue>
        <name>Update parent pro services oppty</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>neo4j_apexBypass_context_set_to_false</fullName>
        <field>neo4j_apexBypass_context__c</field>
        <literalValue>0</literalValue>
        <name>neo4j_apexBypass_context set to false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Always Set Product Name custom text field</fullName>
        <actions>
            <name>Set_Product_Name_to_Product2Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>SFDC-0488_AuraProvisioningEmail...   The targeted text field exists so that rollups can refer to it, so that we workaround the 13+ year SFDC GA Limitation of rollups not able to refer to formulas (trailblazer.salesforce.com/ideaView?id=08730000000BrUAAA0)</description>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>If neo4j_apexBypass_context is true then set false</fullName>
        <actions>
            <name>neo4j_apexBypass_context_set_to_false</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.neo4j_apexBypass_context__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>WFRFU run after apex and this ensures that any apex that wrote neo4j_apexBypass_context true safely becomes false after its execution.  Edited on 2021-04-15 from subsequent to always edited.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>OppProd%2FOppLine%3A Always set apex bypass to false</fullName>
        <actions>
            <name>Always_set_apex_bypass_false</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.neo4j_apexBypass_context__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>WFRFU may go away, so what declarative options allow the reset of bypass flags? The Idea has 13,220 Points on https://trailblazer.salesforce.com/ideaView?id=0873A000000lEZbQAM meanwhile it takes WFRFU or Apex to achieve. We use WFRFU bc they skip VRs</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PSA Set Opportunity Product IsServicesProductLine</fullName>
        <actions>
            <name>PSA_Set_IsServices_Flag_On_Opp_Products</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Mark as Services Opp Product, if product is a Services Product</description>
        <formula>Product2.pse__IsServicesProduct__c = TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate Product Group %28Traction%29</fullName>
        <actions>
            <name>Update_Product_Group</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This rule is part of the Traction tool implementation. It copies the value from the  &quot;Product Group (Traction)&quot; field on the Product object into the &quot;Product Group (Traction)&quot; field on the Opportunity Product object. 
JIRA: SFDCSPT-96</description>
        <formula>ISNEW()  || ISCHANGED (Product2Id)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Product Created on Opportunity%3A %22New PS Products %28Dec 2020%29%22 %28AMERICAS%29</fullName>
        <actions>
            <name>Product_Created_on_Opportunity_New_PS_Products_Dec_2020_AMERICAS</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert users when any of the following PS Products added in Dec 2020 are created on an Opportunity: BootCamp; Solution Audit; Solution Design; SMB Services; Staff augmentation/Expert services; Train-the-Trainer; Data Science Bootcamp; Aura; Consulting.</description>
        <formula>AND( OR (GlobalTerritory__c = &quot;LATAM&quot;, GlobalTerritory__c = &quot;NA&quot;), OR (Product2.Name = &quot;Professional Services - BootCamp&quot;, Product2.Name = &quot;Professional Services - Solution Audit&quot;, Product2.Name = &quot;Professional Services - Solution Design&quot;, Product2.Name = &quot;Professional Services - SMB Services&quot;, Product2.Name = &quot;Professional Services - Staff augmentation/Expert services&quot;, Product2.Name = &quot;Professional Services - Train-the-Trainer&quot;, Product2.Name = &quot;Professional Services - Data Science Bootcamp&quot;, Product2.Name = &quot;Professional Services - Aura&quot;, Product2.Name = &quot;Subscription - PS Consulting&quot;) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Product Created on Opportunity%3A %22New PS Products %28Dec 2020%29%22 %28EMEA%29</fullName>
        <actions>
            <name>Product_Created_on_Opportunity_New_PS_Products_Dec_2020_EMEA</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert users when any of the following PS Products added in Dec 2020 are created on an Opportunity: BootCamp; Solution Audit; Solution Design; SMB Services; Staff augmentation/Expert services; Train-the-Trainer; Data Science Bootcamp; Aura; Consulting.</description>
        <formula>AND( GlobalTerritory__c = &quot;EMEA&quot;, OR (Product2.Name = &quot;Professional Services - BootCamp&quot;, Product2.Name = &quot;Professional Services - Solution Audit&quot;, Product2.Name = &quot;Professional Services - Solution Design&quot;, Product2.Name = &quot;Professional Services - SMB Services&quot;, Product2.Name = &quot;Professional Services - Staff augmentation/Expert services&quot;, Product2.Name = &quot;Professional Services - Train-the-Trainer&quot;, Product2.Name = &quot;Professional Services - Data Science Bootcamp&quot;, Product2.Name = &quot;Professional Services - Aura&quot;, Product2.Name = &quot;Subscription - PS Consulting&quot;) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Product Created on Opportunity%3A %22Product Created on Opportunity%3A %22Neo4j - Aura%22</fullName>
        <actions>
            <name>Product_Created_on_Opportunity_Neo4j_Aura</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert users when &quot;Neo4j - AuraDB&quot; Product is created on an Opportunity.</description>
        <formula>AND(  Product2.Name = &quot;Neo4j - AuraDB&quot;, NOT(ISPICKVAL(Product_Type__c, &quot;Renewal&quot;)))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Product Created on Opportunity%3A %22Subscription - Agile Solutions%22</fullName>
        <actions>
            <name>Product_Created_on_Opportunity_Subscription_Agile_Solutions</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert users when &quot;Subscription - Agile Solutions&quot; Product is created on an Opportunity.</description>
        <formula>Product2.Name = &quot;Subscription - Agile Solutions&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Product Created on Opportunity%3A %22Support - XSP %28Extended Plan%29%22</fullName>
        <actions>
            <name>Product_Created_on_Opportunity_Support_XSP_Extended_Plan</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert users when &quot;Support - XSP (Extended Plan)&quot; Product is created on an Opportunity.</description>
        <formula>Product2.Name = &quot;Support - XSP (Extended Plan)&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Pro Services Oppty</fullName>
        <actions>
            <name>Update_parent_pro_services_oppty</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Professional_Services__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>If Product = professional services. Update Parent Oppty</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Subscription Oppty</fullName>
        <actions>
            <name>Update_Subscription_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Subscription__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>If Product = Subscription. Update Parent Oppty</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
