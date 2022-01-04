public class N4J_LicenseKeyRequest {
    
    public boolean renderForm {get; set;} //flag to render the form
    public License_Key__c lkey {get; set;} //license key object
    public SObject sobj {get; set;} //opportunity/contact/lead associated with the request
    public Account accnt {get; set;} //account associated with the request, if any
    public Neo4J_License_Generation_Service__c cs {get; set;}
    
    //constructor used by all License Key Request Pages
	public N4J_LicenseKeyRequest(ApexPages.StandardController sc){
        lkey = new License_Key__c();
        sobj = sc.getRecord();
        renderForm = false;
        cs = Neo4J_License_Generation_Service__c.getInstance();
    }
    
    
    //defaults the values based on the involved opportunity/contact/lead
    public PageReference defaultKeyRequestDetails(){
        if(sobj.getSObjectType() == Schema.Opportunity.getSObjectType()){ //page is invoked from opportunity
            Opportunity o = [SELECT AccountId, Account.Name FROM Opportunity WHERE Id = :sobj.Id];
            accnt = new Account(Id = o.AccountId, Name = o.Account.Name);
            lkey.Account__c = o.AccountId;
            lkey.Type__c = 'Production';
            //default the primary contact for the opportunity
            List<OpportunityContactRole> lstOCR = [SELECT ContactId, Contact.Email
                                                     FROM OpportunityContactRole
                                                    WHERE OpportunityId = :sobj.Id
                                                      AND IsPrimary = TRUE];
            if(!lstOCR.isEmpty() && lstOCR.get(0).Contact.Email != null){
                lKey.Contact__c = lstOCR.get(0).ContactId;
            }
        }
        if(sobj.getSObjectType() == Schema.Lead.getSObjectType()){ //page is invoked from lead
            //default the expiration date
            lkey.Expiration_Date__c = Date.today().addDays(cs == null || cs.Default_License_Key_Duration_for_Leads__c == null ?
                                                           30 : Integer.valueOf(cs.Default_License_Key_Duration_for_Leads__c));
            lkey.Lead__c = sobj.Id;
            lkey.Type__c = 'Trial';
        }
        if(sobj.getSObjectType() == Schema.Contact.getSObjectType()){ //page is invoked from opportunity
            Contact c = [SELECT AccountId, Account.Name FROM Contact WHERE Id = :sobj.Id];
            accnt = new Account(Id = c.AccountId, Name = c.Account.Name);
            lkey.Account__c = c.AccountId;
            lKey.Contact__c = sobj.id;
            lkey.Type__c = 'Trial';
        }
        
        lkey.Expiration_Date__c = Date.today().addDays(cs == null || cs.Default_License_Key_Duration_for_Leads__c == null ?
                                                           30 : Integer.valueOf(cs.Default_License_Key_Duration_for_Leads__c));
        lkey.Type__c = 'Trial';
        
        ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.INFO,     '<H3>Important Notes</H3>' + 
                                                                                   '<UL><LI>Key type = <B><I>Trial</I></B> can be issued by anyone with access to this form.</LI>' +
                                                                                   '<LI>Key type = <B><I>Production</I></B> should only be issued by the Customer Success team and the key should tie to the <B><I>Closed-Won</I></B> opportunity.</LI>' +
                                                                                   '<LI>Only 1 key per product per opportunity is necessary for either <B><I>Trial</I></B> or <B><I>Production</I></B> purposes. If multiple users on the project need a key, indicate the number of users in the Quantity field, and then generate 1 key to go to the primary contact. Once generated, the email containing the key can be forwarded to other recipients who need it.</LI>' + 
                                                                                   '<LI>For <B><I>Production</I></B> keys, set the expiration date to the last date of the contract.</LI></UL>');
        ApexPages.addMessage(msg);
        
        renderForm = true;
        return null;
    }
    
    public PageReference redirectBack(){
        return new PageReference('/' + sobj.Id); 
    }
    
    public PageReference initiateKeyRequest(){
        
        ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.INFO,     '<H3>Important Notes</H3>' + 
                                                                                   '<UL><LI>Key type = <B><I>Trial</I></B> can be issued by anyone with access to this form.</LI>' +
                                                                                   '<LI>Key type = <B><I>Production</I></B> should only be issued by the Customer Success team and the key should tie to the <B><I>Closed-Won</I></B> opportunity.</LI>' +
                                                                                   '<LI>Only 1 key per product per opportunity is necessary for either <B><I>Trial</I></B> or <B><I>Production</I></B> purposes. If multiple users on the project need a key, indicate the number of users in the Quantity field, and then generate 1 key to go to the primary contact. Once generated, the email containing the key can be forwarded to other recipients who need it.</LI>' + 
                                                                                   '<LI>For <B><I>Production</I></B> keys, set the expiration date to the last date of the contract.</LI></UL>');
        ApexPages.addMessage(msg);
        
        if(lkey.Expiration_Date__c < Date.today()){
            lkey.Expiration_Date__c.addError('Expiration Date for the license key cannot be in the past');
            return null;
        }
        if(lkey.Quantity__c < 1 || lkey.Quantity__c > 100000 ){
            lkey.Quantity__c.addError('Quantity must be between 1 and 100,000');
            return null;
        }
        
        if(lkey.Expiration_Date__c < Date.today()){
            lkey.Expiration_Date__c.addError('Expiration Date for the license key cannot be in the past');
            return null;
        }
        if(sobj.getSObjectType() == Schema.Opportunity.getSObjectType() || 
           sobj.getSObjectType() == Schema.Contact.getSObjectType()){
               //check if the contact has an email address
               Contact c = [SELECT Name, Email FROM Contact WHERE Id = :lkey.Contact__c];
               if(c.Email == null){
                   ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,
                               'Selected contact record does not have an email address. Please specify an email address by clicking' +
                               '<a href="/' + lkey.Contact__c + '" target="_new"> here </a>'));
                   return null;
               }
          lkey.Email__c = c.Email;
          lkey.Organization__c = accnt.name;
          lkey.Registrant__c = c.Name;
        }
        if(sobj.getSObjectType() == Schema.Opportunity.getSObjectType()){
            lkey.Opportunity__c = sObj.Id;
        }
        if(sobj.getSObjectType() == Schema.Lead.getSObjectType()){
             //check if the lead has an email address and company name
            Lead l = [SELECT Name, Company, Email FROM Lead WHERE Id = :sobj.id];
            if(l.Email == null){
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,
                               'Lead record does not have an email address. Please specify an email address by clicking' +
                               '<a href="/' + sobj.id + '" target="_new"> here </a>'));
                return null;
            }
            lkey.Email__c = l.Email;
            lkey.Registrant__c = l.Name;
            lkey.Organization__c = l.Company;                    
         
        }
        lkey.X_Generate_License_Key__c = true;
        INSERT lkey;
        return new PageReference('/' + lkey.Id);
    }
    
}