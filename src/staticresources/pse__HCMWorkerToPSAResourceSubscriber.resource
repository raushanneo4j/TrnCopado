<?xml version="1.0"?><?target data?>
<Config>

<!-- straight mappings for Contact and Account -->
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="hireDate" fferpcore__TargetField__c="pse__Start_Date__c"/>
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="prefix" fferpcore__TargetField__c="Salutation"/>
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="workEmail" fferpcore__TargetField__c="Email"/>

<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="firstName" fferpcore__TargetField__c="FirstName"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="lastName" fferpcore__TargetField__c="LastName"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="hireDate" fferpcore__TargetField__c="pse__Start_Date__pc"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="prefix" fferpcore__TargetField__c="Salutation"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="workEmail" fferpcore__TargetField__c="PersonEmail"/>

<!-- children of work assignments for Contact -->
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="workerAssignment,assignmentEndDate" fferpcore__TargetField__c="pse__Last_Date__c"/>
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="countryTransformation" fferpcore__JsonPath__c="workerAssignment,country" fferpcore__TargetField__c="pse__Region__c"/>
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="departmentTransformation" fferpcore__JsonPath__c="workerAssignment,department" fferpcore__TargetField__c="pse__Practice__c"/>
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="divisionTransformation" fferpcore__JsonPath__c="workerAssignment,division" fferpcore__TargetField__c="pse__Group__c"/>
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="jobTransformation" fferpcore__JsonPath__c="workerAssignment,job" fferpcore__TargetField__c="Title"/>
<!-- children of user for Contact -->
<fferpcore__DSCustomMapping__c sObjectType="Contact" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="user,userId" fferpcore__TargetField__c="pse__Salesforce_User__c"/>
<!-- children of work assignments for Account -->
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="workerAssignment,assignmentEndDate" fferpcore__TargetField__c="pse__Last_Date__pc"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="countryTransformation" fferpcore__JsonPath__c="workerAssignment,country" fferpcore__TargetField__c="pse__Region__pc"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="departmentTransformation" fferpcore__JsonPath__c="workerAssignment,department" fferpcore__TargetField__c="pse__Practice__pc"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="divisionTransformation" fferpcore__JsonPath__c="workerAssignment,division" fferpcore__TargetField__c="pse__Group__pc"/>
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="jobTransformation" fferpcore__JsonPath__c="workerAssignment,job" fferpcore__TargetField__c="PersonTitle"/>
<!-- children of user for Account -->
<fferpcore__DSCustomMapping__c sObjectType="Account" fferpcore__DataTransformationTable__c="" fferpcore__JsonPath__c="user,userId" fferpcore__TargetField__c="pse__Salesforce_User__pc"/>
</Config>
