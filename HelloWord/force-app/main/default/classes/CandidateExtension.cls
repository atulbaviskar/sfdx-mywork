public class CandidateExtension {
    
    private final Candidate_Atul__c recordcandidate;
    private List<Candidate_Atul__c> lstCandiateValue = new List<Candidate_Atul__c>();
    public List<Candidate_Atul__c> candidates {get; set;}
    public List<Candidate_Atul__c> lstcandidate =new  List<Candidate_Atul__c>();
    public id candidateId {get; set;}
    public String JobID{get; set;}
    list<Job_Atul__c> lstjob = new list<Job_Atul__c>();
    public CandidateExtension(ApexPages.StandardController controller)
    {     
        this.recordcandidate=(Candidate_Atul__c)controller.getRecord();
    }
  
    public PageReference saveCandidateDetail()
    {
       JobID=apexpages.currentpage().getparameters().get('jobId');       
       lstjob=[SELECT ID,Name FROM Job_Atul__c WHERE id=:JobID];
       lstcandidate.add(recordcandidate);
       //lstcandidate.add(lstjob);
       insert lstcandidate;
       return Page.CandidateJobDispaly;
    }
}   
    /*
        public CandidateExtension()
    {
         candidates=[SELECT Name FROM Candidate_Atul__c];
         system.debug('chile'+candidates);
    }*/