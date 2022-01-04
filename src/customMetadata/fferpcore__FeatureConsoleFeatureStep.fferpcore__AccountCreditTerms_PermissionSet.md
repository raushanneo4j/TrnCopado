<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Create Permission Sets</label>
    <protected>false</protected>
    <values>
        <field>fferpcore__Configuration__c</field>
        <value xsi:type="xsd:string">{
	&quot;ErpAccountCreditTermsRead&quot;: {
		&quot;Write Permission Set Label&quot;: &quot;FDN Account Credit Terms - Read&quot;,
		&quot;Write Permission Set Description&quot;: &quot;View accounts and account credit terms.&quot;,
		&quot;objects&quot;: {
			&quot;Account&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;fields&quot;: {
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate1__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate2__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate3__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate4__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset1__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset2__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset3__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset4__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description1__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description2__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description3__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description4__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount1__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount2__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount3__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount4__c&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;pages&quot;: {
			&quot;fferpcore__AccountCreditTermsHelp&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			},
			&quot;fferpcore__HelpLoader&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			}
		}
	},
	&quot;ErpAccountCreditTermsEdit&quot;: {
		&quot;Write Permission Set Label&quot;: &quot;FDN Account Credit Terms - Edit&quot;,
		&quot;Write Permission Set Description&quot;: &quot;View accounts, and edit account credit terms.&quot;,
		&quot;objects&quot;: {
			&quot;Account&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c&quot;: {
				&quot;enable&quot;: &quot;CRU&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;fields&quot;: {
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;pages&quot;: {
			&quot;fferpcore__AccountCreditTermsHelp&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			},
			&quot;fferpcore__HelpLoader&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			}
		}
	},
	&quot;ErpAccountCreditTermsDelete&quot;: {
		&quot;Write Permission Set Label&quot;: &quot;FDN Account Credit Terms - Delete&quot;,
		&quot;Write Permission Set Description&quot;: &quot;View accounts, and delete account credit terms.&quot;,
		&quot;objects&quot;: {
			&quot;Account&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c&quot;: {
				&quot;enable&quot;: &quot;RUD&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;fields&quot;: {
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;pages&quot;: {
			&quot;fferpcore__AccountCreditTermsHelp&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			},
			&quot;fferpcore__HelpLoader&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			}
		}
	},
	&quot;ErpAccountCreditTerms&quot;: {
		&quot;Write Permission Set Label&quot;: &quot;FDN Account Credit Terms&quot;,
		&quot;Write Permission Set Description&quot;: &quot;View accounts, and edit and delete account credit terms.&quot;,
		&quot;objects&quot;: {
			&quot;Account&quot;: {
				&quot;enable&quot;: &quot;R&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c&quot;: {
				&quot;enable&quot;: &quot;CRUD&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;fields&quot;: {
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__BaseDate4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__DaysOffset4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Description4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount1__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount2__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount3__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			},
			&quot;fferpcore__AccountCreditTerms__c.fferpcore__Discount4__c&quot;: {
				&quot;enable&quot;: &quot;ER&quot;,
				&quot;disable&quot;: &quot;&quot;
			}
		},
		&quot;pages&quot;: {
			&quot;fferpcore__AccountCreditTermsHelp&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			},
			&quot;fferpcore__HelpLoader&quot;: {
				&quot;enable&quot;: &quot;true&quot;,
				&quot;disable&quot;: &quot;false&quot;
			}
		}
	}
}</value>
    </values>
    <values>
        <field>fferpcore__DisableRevertAction__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>fferpcore__Feature__c</field>
        <value xsi:type="xsd:string">fferpcore__CreditTerms</value>
    </values>
    <values>
        <field>fferpcore__IsOptional__c</field>
        <value xsi:type="xsd:string">Required</value>
    </values>
    <values>
        <field>fferpcore__StepDescription__c</field>
        <value xsi:type="xsd:string">fferpcore__ErpFeatureStepDescriptionAccountCreditTermsPermissionSet</value>
    </values>
    <values>
        <field>fferpcore__StepNumber__c</field>
        <value xsi:type="xsd:double">3.0</value>
    </values>
    <values>
        <field>fferpcore__StepType__c</field>
        <value xsi:type="xsd:string">Write Permission Set</value>
    </values>
</CustomMetadata>
