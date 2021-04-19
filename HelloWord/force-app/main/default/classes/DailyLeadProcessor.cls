public class DailyLeadProcessor implements Schedulable  {
  public void execute(SchedulableContext ctx) {
     
      List<Lead> lstLead = [SELECT Id, Name,LeadSource 
            FROM Lead where LeadSource = null ];
      for(Lead objLead:lstLead){
          objLead.LeadSource = 'Dreamforce';
      }
      update lstLead;
    }
}