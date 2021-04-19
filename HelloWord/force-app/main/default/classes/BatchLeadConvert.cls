public with sharing class BatchLeadConvert implements Database.Batchable<SObject>,Database.RaisesPlatformEvents{
    
    private final String CONVERTED_STATUS = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1].MasterLabel;
    
    public Database.QueryLocator start(Database.BatchableContext ctx){
        return Database.getQueryLocator([SELECT Id FROM Lead WHERE ConvertedContactId = null]);
    }
    
    public void execute(Database.BatchableContext ctx, List<Lead> records){
        List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
        for(Lead record:records){
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setConvertedStatus(CONVERTED_STATUS);
            lc.setLeadId(record.Id);
            
            leadConverts.add(lc);
        }
        Database.convertLead(leadConverts, true);
    }
    
    public void finish(Database.BatchableContext ctx){
        AsyncApexJob job = [SELECT Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems,
                            CreatedBy.Email FROM AsyncApexJob WHERE Id =:ctx.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {job.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Update Company Code Batch ' + job.Status);
        mail.setPlainTextBody('Records processed ' + job.TotalJobItems +  ' with '+ job.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}