public class JobExtension {
   
    public Job_Atul__c job {get; set;}  
    public Candidate_Atul__c candidate {get; set;}
    public List<Job_Atul__c> createdJob {get; set;}
    public list<Job_Atul__c> lstOfActivatejob{get;set;}
    
    public JobExtension(ApexPages.StandardController controller)  
    {
        string jobId = Apexpages.currentPage().getParameters().get('jobId');
        if(!String.isBlank(jobId))
        {
            createdJob = [SELECT Name,Expires_On__c,Positions__c,Qualification_Required__c,Certification_Required__c,Required_Skills__c,Salary_Offered__c FROM Job_Atul__c WHERE Id=:jobId];
        	job = createdJob[0];
          
        }
        else        
            this.job = (Job_Atul__c)controller.getRecord(); 
    }    
    public PageReference saveNext()
    {
        PageReference pageRef;
        if(job != NULL){
            if(job.Id != NULL)
            {
               update job;
               pageRef = Page.JobDisplayPage;
            }
            else
            {
                insert job; 
                pageRef = Page.RegistrationPage2;               
            }  
             pageref.getParameters().put('jobId', job.Id);
        } 
        pageRef.setRedirect(true);
        return pageRef;
    }
    public PageReference goToJobPortal()
    {
            PageReference pageRef;
            string jobId = Apexpages.currentPage().getParameters().get('jobId');
            createdJob=[SELECT Active__c FROM Job_Atul__c WHERE Id=:jobId];
            system.debug('active'+createdJob);
            if(createdJob[0].Active__c==false)
            {
              createdJob[0].Active__c=True;
              update createdJob;
             
              pageRef = Page.JobPortalPage;
              //pageref.getParameters().put('jobId', job.Id);
              pageRef.setRedirect(true);
              return pageRef;
           }
          else
          {
             return null;
          }
     }
   
    
}