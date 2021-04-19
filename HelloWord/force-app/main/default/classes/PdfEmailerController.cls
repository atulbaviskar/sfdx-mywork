public with sharing class PdfEmailerController {
    
   
    public Id selectedAccount    { get; set; }  // Account selected on Visualforce page
    public String selectedReport { get; set; }  // Report selected
    public String recipientEmail { get; set; }  // Send to this email
    
  
    public PageReference sendReport() {

     System.debug('select Account::'+selectedAccount);
        System.debug('recipientEmail::'+recipientEmail);
        System.debug('selectedReport::'+selectedReport);
        if(String.isBlank(this.selectedAccount) || String.isBlank(this.recipientEmail)) {
            ApexPages.addMessage(new 
                ApexPages.Message(ApexPages.Severity.ERROR, 
               'Errors on the form. Please correct and resubmit.'));
            return null; // early out
        }
        

        Account account = [SELECT Name 
                           FROM Account 
                           WHERE Id = :this.selectedAccount 
                           LIMIT 1];
        if(null == account) {
            // Got a bogus ID from the form submission
            ApexPages.addMessage(new 
                ApexPages.Message(ApexPages.Severity.ERROR, 
               'Invalid account. Please correct and resubmit.'));
            return null; // early out
        }
        
        // Create email
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(new String[]{ this.recipientEmail });
        message.setSubject('Account summary for ' + account.Name);
        message.setHtmlBody('Here\'s a summary for the ' + account.Name + ' account.');
        
        // Create PDF
        PageReference reportPage = (PageReference)this.reportPagesIndex.get(this.selectedReport);
        reportPage.getParameters().put('id', this.selectedAccount);
        Blob reportPdf;
        try {
            reportPdf = reportPage.getContentAsPDF();
        }
        catch (Exception e) {
            reportPdf = Blob.valueOf(e.getMessage());
        }
        
        // Attach PDF to email and send
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setContentType('application/pdf');
        attachment.setFileName('AccountSummary-' + account.Name + '.pdf');
        attachment.setInline(false);
        attachment.setBody(reportPdf);
        message.setFileAttachments(new Messaging.EmailFileAttachment[]{ attachment });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ message });
        
        ApexPages.addMessage(new 
            ApexPages.Message(ApexPages.Severity.INFO,
           'Email sent with PDF attachment to ' + this.recipientEmail));

        return null; // Stay on same page, even on success
    }
    
    
    /***** Form Helpers *****/
    
    // Ten recently-touched accounts, for the Account selection menu
    public List<SelectOption> recentAccounts {
        get {
            if(null == recentAccounts){
                recentAccounts = new List<SelectOption>();
                for(Account acct : [SELECT Id,Name,LastModifiedDate 
                                    FROM Account 
                                    ORDER BY LastModifiedDate DESC 
                                    LIMIT 10]) {
                    recentAccounts.add(new SelectOption(acct.Id, acct.Name));
                }
            }
            return recentAccounts;
        }
        set;
    }
    
    // List of available reports, for the Summary Format selection menu
    public List<SelectOption> reportFormats {
        get {
            if(null == reportFormats) {
                reportFormats = new List<SelectOption>();
                for(Map <String,Object> report : reports) {
                    reportFormats.add(new SelectOption(
                        (String)report.get('name'), (String)report.get('label')));
                }
            }
            return reportFormats;
        }
        set;
    }

    private Map<String,PageReference> reportPagesIndex;
    private List<Map<String,Object>> reports {
        get {
            if(null == reports) {
                reports = new List<Map<String,Object>>();
             
                Map<String,Object> simpleReport = new Map<String,Object>();
                simpleReport.put('name',  'simple');
                simpleReport.put('label', 'Simple');
                simpleReport.put('page',   Page.ReportAccountSimple);
                reports.add(simpleReport);
              
                this.reportPagesIndex = new Map<String,PageReference>();
                for(Map<String,Object> report : reports) {
                    this.reportPagesIndex.put(
                        (String)report.get('name'), (PageReference)report.get('page'));
                }
            }
            return reports;
        }
        set;
    }
}