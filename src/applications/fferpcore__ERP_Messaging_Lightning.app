<?xml version="1.0" encoding="UTF-8"?>
<CustomApplication xmlns="http://soap.sforce.com/2006/04/metadata">
    <brand>
        <headerColor>#00A7CE</headerColor>
        <logoVersion>2</logoVersion>
        <shouldOverrideOrgTheme>false</shouldOverrideOrgTheme>
    </brand>
    <description>Manage the messaging between your products and schedule ERP jobs.</description>
    <formFactors>Large</formFactors>
    <isNavAutoTempTabsDisabled>false</isNavAutoTempTabsDisabled>
    <isNavPersonalizationDisabled>false</isNavPersonalizationDisabled>
    <label>ERP Administration</label>
    <navType>Standard</navType>
    <profileActionOverrides>
        <actionName>Tab</actionName>
        <content>SDR_Home_Page</content>
        <formFactor>Large</formFactor>
        <pageOrSobjectType>standard-home</pageOrSobjectType>
        <type>Flexipage</type>
        <profile>Neo4j - SDR Manager</profile>
    </profileActionOverrides>
    <profileActionOverrides>
        <actionName>Tab</actionName>
        <content>SDR_Home_Page</content>
        <formFactor>Large</formFactor>
        <pageOrSobjectType>standard-home</pageOrSobjectType>
        <type>Flexipage</type>
        <profile>Neo4j - SDR</profile>
    </profileActionOverrides>
    <tabs>fferpcore__ERPProduct__c</tabs>
    <tabs>fferpcore__MessageType__c</tabs>
    <tabs>fferpcore__DataTransformationTable__c</tabs>
    <tabs>fferpcore__ErpMessaging</tabs>
    <uiType>Lightning</uiType>
</CustomApplication>
