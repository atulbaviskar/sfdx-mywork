public class JobPortalManager {
    
    public Candidate_Atul__c objcandidate {get;set;}
    public list<Candidate_Atul__c> lstcandidate{get;set;}
    public list<Job_Atul__c> lstOfActivatejob{get;set;}
    Public Attachment myfile{get;set;}
   
    public JobPortalManager()
    {
          objcandidate=new Candidate_Atul__c();
           myfile = new Attachment();
          system.debug('lstOfActivatejob'+lstOfActivatejob); 
          string jobId = Apexpages.currentPage().getParameters().get('jobId');
          System.debug('con job id::'+jobId);
          lstOfActivatejob=[SELECT Name,Expires_On__c,Positions__c,Qualification_Required__c,Certification_Required__c,Required_Skills__c,Salary_Offered__c FROM Job_Atul__c WHERE Active__c=:True LIMIT 5];
          lstcandidate=[SELECT Name,Last_Name__c,Salutation__c,Expected_Salary__c,Job__c,Status__c FROM Candidate_Atul__c ];
    } 
    public PageReference applyJobForCandidate()
    {
          
          PageReference pageRef;  
          string jobId = Apexpages.currentPage().getParameters().get('jobId');
        
          pageRef = Page.CandidateRegistrationPage; 
          pageref.getParameters().put('jobId', jobId);
          pageRef.setRedirect(true);
          return pageRef;
    }
    Public Attachment getmyfile()
    {
        return myfile;
    }
    public PageReference saveCandidateDetail()
    {
          PageReference pageRef;  
          string jobId = Apexpages.currentPage().getParameters().get('jobId');
          objcandidate.Job__c=jobId;
          insert objcandidate;
         // Attachment a = new Attachment(parentId = objcandidate.Id, name=myfile.name, body = myfile.body);
        //  insert a;
          pageRef = Page.CandidateJobDispaly; 
          pageRef.setRedirect(true);
          return pageRef;
      }

}