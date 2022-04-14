<?xml version="1.0" encoding="UTF-8"?>
<CustomApplication xmlns="http://soap.sforce.com/2006/04/metadata">
    <brand>
        <headerColor>#00A7CE</headerColor>
        <logoVersion>2</logoVersion>
        <shouldOverrideOrgTheme>false</shouldOverrideOrgTheme>
    </brand>
    <description>Manage your ERP Companies, Company Tax Information, and Tax Codes.</description>
    <formFactors>Large</formFactors>
    <isNavAutoTempTabsDisabled>false</isNavAutoTempTabsDisabled>
    <isNavPersonalizationDisabled>false</isNavPersonalizationDisabled>
    <isNavTabPersistenceDisabled>false</isNavTabPersistenceDisabled>
    <label>ERP Core Concepts</label>
    <navType>Standard</navType>
    <profileActionOverrides>
        <actionName>Tab</actionName>
        <content>SDR_Home_Page</content>
        <formFactor>Large</formFactor>
        <pageOrSobjectType>standard-home</pageOrSobjectType>
        <type>Flexipage</type>
        <profile>Neo4j - SDR</profile>
    </profileActionOverrides>
    <profileActionOverrides>
        <actionName>Tab</actionName>
        <content>SDR_Home_Page</content>
        <formFactor>Large</formFactor>
        <pageOrSobjectType>standard-home</pageOrSobjectType>
        <type>Flexipage</type>
        <profile>Neo4j - SDR Manager</profile>
    </profileActionOverrides>
    <tabs>fferpcore__Company__c</tabs>
    <tabs>fferpcore__TaxCode__c</tabs>
    <tabs>fferpcore__AnalysisItem__c</tabs>
    <tabs>fferpcore__AnalysisMappings</tabs>
    <tabs>fferpcore__AccountExtension__c</tabs>
    <tabs>fferpcore__ProductExtension__c</tabs>
    <uiType>Lightning</uiType>
</CustomApplication>
