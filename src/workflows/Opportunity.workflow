<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Aura_Marketplace_Order_Do_Not_Fulfill</fullName>
        <ccEmails>AR@neo4j.com,nadia.gainsbourg@neo4j.com</ccEmails>
        <description>Aura Marketplace Order - Do Not Fulfill</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Aura_Marketplace_Order_Do_Not_Fulfill</template>
    </alerts>
    <alerts>
        <fullName>Customer_Success_Onboarding_Notification_98_NOT_Top_Account_and_NOT_Neo4j_Aura_P</fullName>
        <ccEmails>davidgordon21+xaybbf7ytpfhgcdfic2o@boards.trello.com,</ccEmails>
        <ccEmails>customer-success@neotechnology.com,renewals@neo4j.com</ccEmails>
        <description>Customer Success Onboarding Notification 98% NOT Top Account and NOT Neo4j - Aura Product</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>david.gordon@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.pecollet@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.shiposh@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Field_Engineer__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Development_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Customer_Success_Templates/Customer_Success_Onboarding_Notification_98_NOT_Top_Account_and_NOT_Neo4j_Aur</template>
    </alerts>
    <alerts>
        <fullName>Customer_Success_Onboarding_Notification_98_Top_Account_and_NOT_Neo4j_AuraDB_Pro</fullName>
        <ccEmails>davidgordon21+xaybbf7ytpfhgcdfic2o@boards.trello.com,</ccEmails>
        <ccEmails>customer-success@neotechnology.com,renewals@neo4j.com</ccEmails>
        <description>Customer Success Onboarding Notification 98% Top Account and NOT Neo4j - AuraDB Product</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>david.gordon@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.pecollet@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.shiposh@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Field_Engineer__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Development_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Customer_Success_Templates/Customer_Success_Onboarding_Notification_98_TOP_Account_and_NOT_Neo4j_AuraDB</template>
    </alerts>
    <alerts>
        <fullName>Customer_Success_Onboarding_Notification_99_and_Neo4j_Aura_Product</fullName>
        <ccEmails>davidgordon21+xaybbf7ytpfhgcdfic2o@boards.trello.com,</ccEmails>
        <ccEmails>customer-success@neotechnology.com,renewals@neo4j.com</ccEmails>
        <description>Customer Success Onboarding Notification 99% and Neo4j - Aura Product</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>david.gordon@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.pecollet@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.shiposh@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Field_Engineer__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Development_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Customer_Success_Templates/Customer_Success_Onboarding_Notification_99_Neo4j_Aura</template>
    </alerts>
    <alerts>
        <fullName>If_Opportunity_Source_Changes_then_send_email_alert</fullName>
        <ccEmails>peter.noges+SFDC-0579_OppSourceChangeAlertForAnalyticsV1_featuremonitor_fyi_i_ignore_same-subject-replies@neo4j.com</ccEmails>
        <description>If Opportunity Source Changes then send email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>arvid.asbrink@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply@neotechnology.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sales_Ops_Templates/Opportunity_Source_was_changed_template</template>
    </alerts>
    <alerts>
        <fullName>If_sub_40_percent_exceeds_40_percent_then_notify_logan_in_partner_team</fullName>
        <ccEmails>peter.noges+featureMonitorSub40ToPost40Alert_fyi_i_ignore_same-subject-replies@neo4j.com</ccEmails>
        <description>If sub 40 percent exceeds 40 percent then notify logan in partner team</description>
        <protected>false</protected>
        <recipients>
            <recipient>logan.smith@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply@neotechnology.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Team/If_sub_40_percent_exceeds_40_percent_then_notify_logan_in_partner_team</template>
    </alerts>
    <alerts>
        <fullName>Neo4j_Aura_Opportunity_Moves_to_25_or_50_Renewal</fullName>
        <description>&quot;Neo4j - Aura&quot; Opportunity Moves to 25% or 50% (Renewal)</description>
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
        <template>unfiled$public/NeoAura_OpportunitytoDifferent_Stage</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Closed_Won</fullName>
        <ccEmails>ar_emea@neo4j.com,ar@neo4j.com</ccEmails>
        <description>Opportunity Closed Won</description>
        <protected>false</protected>
        <recipients>
            <recipient>cecille.barrameda@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kelly.zawalski@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kenny.huang@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mattias.olsson@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Closed_Won</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Closed_Won_PS_Products_Only</fullName>
        <ccEmails>ar_emea@neo4j.com,ar@neo4j.com</ccEmails>
        <description>Opportunity Closed Won (PS Products Only)</description>
        <protected>false</protected>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Release_Management_Sales_Ops/Opportunity_Closed_Won_PS_Products_Only</template>
    </alerts>
    <alerts>
        <fullName>Oppty_Renewal_Oppty_enters_a_stage_that_renewal_team_cares_about</fullName>
        <ccEmails>peter.noges+featuremonitor_a7z3s0000004SNtAAM@neo4j.com</ccEmails>
        <description>Oppty: Renewal Oppty enters a stage that renewal team cares about (a7z3s0000004SNtAAM)</description>
        <protected>false</protected>
        <recipients>
            <recipient>mike.brophy@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply@neotechnology.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sales_Ops_Templates/Oppty_Renewal_Oppty_enters_a_stage_that_renewal_team_cares_about</template>
    </alerts>
    <alerts>
        <fullName>Populate_Use_Case_Information</fullName>
        <description>Populate Use Case Information</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Missing_Use_Case_Information</template>
    </alerts>
    <alerts>
        <fullName>Potential_New_Marketing_Obligations</fullName>
        <ccEmails>dan.fitzpatrick@neo4j.com,lance.kaji+jiannas_alert_01W6A000000ChSg@neotechnology.com</ccEmails>
        <description>Potential New Marketing Obligations</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Marketing_Obligations_Alert</template>
    </alerts>
    <alerts>
        <fullName>Professional_Services_Opportunity_Moved_to_Sales_Ops_Review_98</fullName>
        <description>Professional Services Opportunity Moved to Sales Ops Review (98%)</description>
        <protected>false</protected>
        <recipients>
            <recipient>angelo.bueti@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gopal.nagarajan@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ken.kane@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>maria.turegano@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Professional_Services_Opportunity_Moves_to_Sales_Ops_Review_98</template>
    </alerts>
    <alerts>
        <fullName>Renewal_75_to_50_or_25</fullName>
        <description>Renewal 75% to 50% or 25%</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>lars.nordwall@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Renewal_Moved_Down_from_75</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Opportunity_Closed_Lost</fullName>
        <ccEmails>lance.kaji+jiannas_alert_01W6A000000QJlf@neotechnology.com</ccEmails>
        <description>Renewal Opportunity Closed Lost</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Renewal_Oppty_Closed_Lost</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Opportunity_Moved_Backwards</fullName>
        <description>Renewal Opportunity Moved Backwards</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_has_moved_down</template>
    </alerts>
    <alerts>
        <fullName>Requesting_PO_Status</fullName>
        <ccEmails>ar@neo4j.com</ccEmails>
        <description>Requesting PO Status</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>cecille.barrameda@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>lisa.tran@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mattias.olsson@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>patricia.calalang@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Renewals_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Requesting_PO_Status</template>
    </alerts>
    <alerts>
        <fullName>TEST_License_Delivery</fullName>
        <description>TEST License Delivery</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/X99_Onboarding_Download_License</template>
    </alerts>
    <alerts>
        <fullName>When_Neo4j_Aura_Reaches_SOPS_Review_Send_Alert_About_Provisioning</fullName>
        <ccEmails>aura-customer-success@neo4j.com</ccEmails>
        <description>When &quot;Neo4j - Aura&quot; Reaches SOPS Review, Send Alert About Provisioning</description>
        <protected>false</protected>
        <recipients>
            <recipient>chandler.kaaa@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.gordon@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gopal.nagarajan@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kay.nair@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sumeet.toprani@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply@neotechnology.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sales_Ops_Templates/Pbe_Product_Aura_Ent_Provision_Email</template>
    </alerts>
    <alerts>
        <fullName>When_Sales_Stage_Moves_from_Closed_Won</fullName>
        <ccEmails>lance.kaji+jiannas_alert_01W6A000000Ci75@neotechnology.com</ccEmails>
        <description>When Sales Stage Moved from Closed Won</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_Moved</template>
    </alerts>
    <alerts>
        <fullName>X1_SDR_Comp_Opportunity_Approval_Request_Approved_by_SDR_Director</fullName>
        <description>1% SDR Comp Opportunity Approval Request Approved by SDR Director</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>salesops@neo4j.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/OPP_1_SDR_Comp_Opportunity_Approval_Request_Approved_by_SDR_Director</template>
    </alerts>
    <alerts>
        <fullName>X1_SDR_Comp_Opportunity_Approval_Request_Rejected_by_SDR_Director</fullName>
        <description>1% SDR Comp Opportunity Approval Request Rejected by SDR Director</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>salesops@neo4j.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/OPP_1_SDR_Comp_Opportunity_Approval_Request_Rejected_by_SDR_Director</template>
    </alerts>
    <alerts>
        <fullName>X1_SDR_Comp_Opportunity_Approval_Request_Rejected_by_SDR_Manager</fullName>
        <description>1% SDR Comp Opportunity Approval Request Rejected by SDR Manager</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>salesops@neo4j.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/OPP_1_SDR_Comp_Opportunity_Approval_Request_Rejected_by_SDR_Manager</template>
    </alerts>
    <alerts>
        <fullName>X1_SDR_Comp_Opportunity_Approval_Request_Submitted_to_SDR_Manager</fullName>
        <description>1% SDR Comp Opportunity Approval Request Submitted to SDR Manager</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>nadia.gainsbourg@neo4j.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/OPP_1_SDR_Comp_Opportunity_Approval_Request_Submitted_to_SDR_Manager</template>
    </alerts>
    <fieldUpdates>
        <fullName>Always_set_apex_bypass_false</fullName>
        <description>WFRFU may go away, so what declarative options allow the reset of bypass flags? The Idea has 13,220 Points on https://trailblazer.salesforce.com/ideaView?id=0873A000000lEZbQAM meanwhile it takes WFRFU or Apex to achieve.	We use WFRFU bc they skip VRs</description>
        <field>neo4j_apexBypass_context__c</field>
        <literalValue>0</literalValue>
        <name>Always set apex bypass false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_date</fullName>
        <field>Manager_Approval_Date__c</field>
        <formula>TODAY()</formula>
        <name>Approval date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Manager_Approval_Date_Today</fullName>
        <field>Manager_Approval_Date__c</field>
        <formula>TODAY ()</formula>
        <name>Manager Approval Date Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rejection_Update</fullName>
        <field>StageName</field>
        <literalValue>Qualification SDR</literalValue>
        <name>Rejection Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_1_SDR_Date</fullName>
        <field>X1_SDR_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update 1% SDR Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Close_Date_Closed_Won</fullName>
        <field>CloseDate</field>
        <formula>Today()</formula>
        <name>Update Close Date Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Forecast_Status_To_Pipeline</fullName>
        <description>Update Forecast Status To Pipeline</description>
        <field>Forecast_Status__c</field>
        <literalValue>Pipeline</literalValue>
        <name>Update Forecast Status To Pipeline</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Has_Pro_Services_Line_Item_Field</fullName>
        <field>Has_Pro_Services_Line_Items__c</field>
        <literalValue>0</literalValue>
        <name>Update Has Pro Services Line Items</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Needs_Analysis_Date</fullName>
        <description>Update Needs Analysis Date</description>
        <field>Needs_Analysis_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Needs Analysis Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Prior_Stage</fullName>
        <field>Prior_Stage__c</field>
        <formula>TEXT( PRIORVALUE( StageName ) )</formula>
        <name>Update Prior Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Qualification_Date</fullName>
        <field>Qualification_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Qualification Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Recorded_Enterprise_Opp_Date_Fiel</fullName>
        <field>Recorded_Opp_Date__c</field>
        <formula>BLANKVALUE(Manager_Approval_Date__c,(BLANKVALUE(Qualification_Date__c, TODAY())))</formula>
        <name>Update Recorded Enterprise Opp Date Fiel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_Change_Date</fullName>
        <field>Stage_Change_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Stage Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X1_SDR_Comp_Approval_Status_Date</fullName>
        <description>Update &apos;1% SDR Comp Approval Decision Date&apos; field with TODAY&apos;s date.</description>
        <field>X1SDRCompApprovalStatusDate__c</field>
        <formula>TODAY()</formula>
        <name>1% SDR Comp Approval Status Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X1_SDR_Comp_Dir_Approved</fullName>
        <description>Update &apos;1% SDR Comp Approval Decision&apos; field with the appropriate value.</description>
        <field>X1SDRCompApprovalStatus__c</field>
        <literalValue>Approved by SDR Director - Final Approval</literalValue>
        <name>1% SDR Comp Dir Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X1_SDR_Comp_Dir_Rejected</fullName>
        <description>Update &apos;1% SDR Comp Approval Decision&apos; field with the appropriate value.</description>
        <field>X1SDRCompApprovalStatus__c</field>
        <literalValue>Rejected by SDR Director - Final Rejection</literalValue>
        <name>1% SDR Comp Dir Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X1_SDR_Comp_Mgr_Approved</fullName>
        <description>Update &apos;1% SDR Comp Approval Status&apos; field with the appropriate value.</description>
        <field>X1SDRCompApprovalStatus__c</field>
        <literalValue>Approved by SDR Manager - Pending SDR Director Approval</literalValue>
        <name>1% SDR Comp Mgr Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X1_SDR_Comp_Mgr_Rejected</fullName>
        <description>Update &apos;1% SDR Comp Approval Status&apos; field with the appropriate value.</description>
        <field>X1SDRCompApprovalStatus__c</field>
        <literalValue>Rejected by SDR Manager - Final Rejection</literalValue>
        <name>1% SDR Comp Mgr Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X1_SDR_Comp_Submitted_to_Mgr</fullName>
        <description>Update &apos;1% SDR Comp Approval Status&apos; field with the appropriate value.</description>
        <field>X1SDRCompApprovalStatus__c</field>
        <literalValue>Submitted - Pending SDR Manager Approval</literalValue>
        <name>1% SDR Comp Submitted to Mgr</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>neo4j_apexBypass_context_set_to_false</fullName>
        <field>neo4j_apexBypass_context__c</field>
        <literalValue>0</literalValue>
        <name>neo4j_apexBypass_context set to false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Customer Success Onboarding Notification 98%25 NOT Top Account and NOT Neo4j - Aura Product</fullName>
        <actions>
            <name>Customer_Success_Onboarding_Notification_98_NOT_Top_Account_and_NOT_Neo4j_Aura_P</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Sales Ops Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Success_Top_Account__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.New_Cross_Sell_Up_Sell_Summary__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.num_lines_Excl_Neo4j_Aura__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Onboarding_Product_Count__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>Notify Customer Success and others when an Opportunity is moved to 98% (Sales Ops Review), the Account is NOT a top Account, no &apos;Neo4j - Aura&apos; Products exist on the Opp, but at least one Product requires onboarding. JIRA: SFDCSPT-253; 533; 610</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Success Onboarding Notification 98%25 Top Account and NOT Neo4j - AuraDB Product</fullName>
        <actions>
            <name>Customer_Success_Onboarding_Notification_98_Top_Account_and_NOT_Neo4j_AuraDB_Pro</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Sales Ops Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Customer_Success_Top_Account__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.New_Cross_Sell_Up_Sell_Summary__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.num_lines_Excl_Neo4j_Aura__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Onboarding_Product_Count__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>Notify Customer Success and others when an Opportunity is moved to 98% (Sales Ops Review), the Account is a top Account, NO Neo4j - AuraDB Products exist on the Opportunity, and at least one Product requires onboarding. JIRA: SFDCSPT-253; SFDCSPT-533</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Success Onboarding Notification 99%25 and %27Neo4j - Aura%27 Product</fullName>
        <actions>
            <name>Customer_Success_Onboarding_Notification_99_and_Neo4j_Aura_Product</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Finance Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.New_Cross_Sell_Up_Sell_Summary__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.num_lines_Neo4j_Aura__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Renewal</value>
        </criteriaItems>
        <description>Notify Customer Success and others when an Opportunity is moved to 99% (Finance Review) and at least one Neo4j - AuraDB Product is attached to the Opportunity. JIRA: SFDCSPT-253; 610</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>If Opportunity Source Changes then send email alert</fullName>
        <actions>
            <name>If_Opportunity_Source_Changes_then_send_email_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>peter.noges+SFDC-0579_OppSourceChangeAlertForAnalyticsV1_featuremonitor@neo4j.com</description>
        <formula>and( NOT(isnew()), ischanged(Opportunity_Source__c) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>If sub 40 percent exceeds 40 percent then notify logan in partner team</fullName>
        <actions>
            <name>If_sub_40_percent_exceeds_40_percent_then_notify_logan_in_partner_team</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>/*Requirement: notified if opp moves from below 40% to 40% or above*/</description>
        <formula>AND( ISCHANGED(Probability), PRIORVALUE(Probability)&lt;=0.40, Probability &gt;0.40 )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Manager Approval Date Today</fullName>
        <actions>
            <name>Manager_Approval_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Manager_Approved__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Manager_Approval_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp Moved Down From Closed Won</fullName>
        <actions>
            <name>When_Sales_Stage_Moves_from_Closed_Won</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Prior_Stage__c</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp%3A Always set apex bypass to false</fullName>
        <actions>
            <name>Always_set_apex_bypass_false</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.neo4j_apexBypass_context__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>WFRFU may go away, so what declarative options allow the reset of bypass flags? The Idea has 13,220 Points on https://trailblazer.salesforce.com/ideaView?id=0873A000000lEZbQAM meanwhile it takes WFRFU or Apex to achieve.	We use WFRFU bc they skip VRs</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Closed Won</fullName>
        <actions>
            <name>Opportunity_Closed_Won</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <description>Sends an email alert when an Opportunity has been moved to stage Closed Won. Modified: JIRA: SFDCSPT-308</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Closed Won %28PS Products Only%29</fullName>
        <actions>
            <name>Opportunity_Closed_Won_PS_Products_Only</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Prof_Services_Product_Count__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>Sends an email alert when an Opportunity with at least one PS Product attached has been moved to stage Closed Won. Modified: JIRA: SFDCSPT-646</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Renewal Oppty enters a stage that renewal team cares about</fullName>
        <actions>
            <name>Oppty_Renewal_Oppty_enters_a_stage_that_renewal_team_cares_about</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>added in a7z3s0000004SNtAAM (Oppty Notifications (Renewals))</description>
        <formula>AND(  	OR(  		AND(isnew(),OR(TEXT(StageName)==&apos;Sales Ops Review&apos;,TEXT(StageName)==&apos;Renewal DQ 90%&apos;,IsWon,and(not(IsWon),IsClosed))),  		AND(ischanged(StageName),OR(TEXT(StageName)==&apos;Sales Ops Review&apos;,TEXT(StageName)==&apos;Renewal DQ 90%&apos;,IsWon,and(not(IsWon),IsClosed)))   	),   	OR( CONTAINS( RecordType.DeveloperName, &quot;Renew&quot;), CONTAINS(TEXT(Type),&quot;Renew&quot;),CONTAINS(RecordType.Name,&quot;Renew&quot;) )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Potential New Marketing Obligations</fullName>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Marketing_Obligations__c</field>
            <operation>notEqual</operation>
            <value>None</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Has_Subscription_Line_Items__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.New_or_Cross_Sell_Summary__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>alert Dan F when new subscription deal closes and Marketing Obligations populated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Potential_New_Marketing_Obligations</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Professional Services Opportunity Moved to Sales Ops Review %2898%25%29</fullName>
        <actions>
            <name>Professional_Services_Opportunity_Moved_to_Sales_Ops_Review_98</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Has_Pro_Services_Line_Items__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Sales Ops Review</value>
        </criteriaItems>
        <description>Alert appropriate PS team members when an Opportunity with at least one PS product moves to Sales Ops Review (98%) JIRA: SFDCSPT-664</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Renewal 75%25 to 50%25 or 25%25</fullName>
        <actions>
            <name>Renewal_75_to_50_or_25</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Prior_Stage__c</field>
            <operation>equals</operation>
            <value>Renewal 75%</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Renewal 25%,Renewal 50%</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Renewal Oppty Closed Lost</fullName>
        <actions>
            <name>Renewal_Opportunity_Closed_Lost</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Requesting PO Status</fullName>
        <actions>
            <name>Requesting_PO_Status</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Sales Ops Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PO_Pending__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Needs Analysis Date</fullName>
        <actions>
            <name>Update_Needs_Analysis_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Needs Analysis,Proposal/Price Quote,Selected / Negotiation,Contract Negotiation,Procurement,Sales Ops Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Needs_Analysis_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>When Sales Stage = Needs Analysis set Needs Analysis date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Qualification Date</fullName>
        <actions>
            <name>Update_Forecast_Status_To_Pipeline</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Qualification_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Qualification,Needs Analysis,Proposal/Price Quote,Selected / Negotiation,Contract Negotiation,Procurement,Sales Ops Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Qualification_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>When Sales Stage = 10%, set qualification date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update 1%25 SDR Date</fullName>
        <actions>
            <name>Update_1_SDR_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Qualification SDR,Qualification,Needs Analysis,Proposal/Price Quote,Selected / Negotiation,Contract Negotiation,Procurement,Sales Ops Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.X1_SDR_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Has Pro Services Line Items</fullName>
        <actions>
            <name>Update_Has_Pro_Services_Line_Item_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Prof_Services_Product_Count__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <description>This Workflow rule was created to uncheck the &quot;Has Pro Services Line Item&quot; field from opportunity whenever all the professional services product will be removed from the line item.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Prior Stage</fullName>
        <actions>
            <name>Update_Prior_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( StageName )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Recorded Opp Date Field</fullName>
        <actions>
            <name>Update_Recorded_Enterprise_Opp_Date_Fiel</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Recorded_Opp__c</field>
            <operation>equals</operation>
            <value>Startup,Corporate,Enterprise</value>
        </criteriaItems>
        <description>update recorded enterprise opp date field when recorded enterprise opp field is populated as startup/midmarket/enterprise</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Stage Change Date</fullName>
        <actions>
            <name>Update_Stage_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( StageName )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>When %22Neo4j - Aura%22 Reaches SOPS Review%2C Send Alert About Provisioning</fullName>
        <actions>
            <name>When_Neo4j_Aura_Reaches_SOPS_Review_Send_Alert_About_Provisioning</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Sales Ops Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.num_lines_Neo4j_Aura__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <description>SFDC-0488_AuraProvisioningEmailForLanceKajiV1.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Z_TEST License Delivery</fullName>
        <actions>
            <name>TEST_License_Delivery</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Free Startup License</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>equals</operation>
            <value>jianna test account 12</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
