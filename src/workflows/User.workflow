<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>New User Created in Salesforce</fullName>
        <active>true</active>
        <description>When a new User record is created in Salesforce, alert the appropriate parties.</description>
        <formula>$User.Id  &lt;&gt; &quot;&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
