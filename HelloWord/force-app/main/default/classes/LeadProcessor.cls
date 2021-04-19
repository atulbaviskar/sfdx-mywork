global class LeadProcessor implements Database.Batchable<sObject>,Database.Stateful{
    
    global String [] email = new String[] {'atul.baviskar@enzigma.in'};
        global Database.QueryLocator start(Database.BatchableContext BC){
            string qry = 'SELECT id,Name,LeadSource FROM Lead';
            return Database.getQueryLocator(qry);
            
        }
    global void execute(Database.BatchableContext BC,List<Lead> scope){
        
        System.debug('scope size::'+scope.size());
        list<Lead> lstLead =  new list<Lead>();
        for(Lead objLead : scope){
            if(objLead.LeadSource == 'Dreamforce'){
                objLead.Company = 'TestBA';
                lstLead.add(objLead);
            }
        }
        update lstLead;
    }
    global void finish(Database.BatchableContext BC){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        AsyncApexJob a = [SELECT a.TotalJobItems,a.Status,a.NumberOfErrors,a.JobType,a.JobItemsProcessed,a.ExtendedStatus,a.CreatedById,a.CreatedDate 
                          FROM AsyncApexJob  a
                          WHERE id = :BC.getJobId()];
        
        System.debug('$$$ Jobid is'+BC.getJobId());
        
        mail.setToAddresses(email);
        mail.setReplyTo('atul.baviskar@enzigma.in'); // Add here your email address
        mail.setSenderDisplayName('Apex Batch Processing Module');
        mail.setSubject('Batch Processing '+a.Status);
        mail.setPlainTextBody('The Batch Apex job processed'
                              + a.TotalJobItems+'batches with '+a.NumberOfErrors+'failures'+'Job Itemprocessed are'+a.JobItemsProcessed);
        Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
    }
    
}