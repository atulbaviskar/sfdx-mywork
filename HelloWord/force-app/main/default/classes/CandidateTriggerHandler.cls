public class CandidateTriggerHandler {
    
      
    /* public static void OnDecativeJobForAppliedCandidate(List<Candidate_Atul__c> lstNewCandidate)
     {
          
       
         Integer HiredCandidate=0;
        List<Job_Atul__c>  lstofjob =new List<Job_Atul__c>();
        Job_Atul__c objjobs=new Job_Atul__c();
      
        lstofjob = [SELECT Active__c,Positions__c FROM Job_Atul__c WHERE ID =:lstNewCandidate[0].Job__c];
       
        for(Candidate_Atul__c objCandidate:lstNewCandidate)
        {
            if(lstNewCandidate[0].Status__c=='Hired')
           {
            HiredCandidate++;
           }
        }
        

        if(lstofjob[0].Active__c==True )
        {
             system.debug('Hired Candidate'+HiredCandidate);
            if(HiredCandidate==lstofjob[0].Positions__c)
            {
               
                  lstofjob[0].Active__c=False;
                  update lstofjob;
            }
            else 
            {
                 
               lstNewCandidate[0].Status__c.addError('Candidates can not apply for it anymore.');
            }
            
        }
        else
        {
            lstNewCandidate[0].Status__c.addError('Job is decative.');
        }

   }*/
     public static void OnNotAllowCandidateForDeactiveJob(List<Candidate_Atul__c> lstNewCandidate1)
     {
            integer counter=0;
            system.debug('new candidate list'+lstNewCandidate1);
            List<Candidate_Atul__c> lstHiredcandidate=[SELECT Id FROM Candidate_Atul__c WHERE Status__c = : 'Hired'];
         //  List<Candidate_Atul__c> lstAppliedcandidate=[SELECT Id FROM Candidate_Atul__c WHERE Status__c = : 'Applied'];
             Candidate_Atul__c objcan=new Candidate_Atul__c();
            Job_Atul__c objJobDetail = [SELECT Active__c,Positions__c FROM Job_Atul__c WHERE ID =:lstNewCandidate1[0].Job__c];
            system.debug('job detail'+objJobDetail);
           
            System.debug('list of candidate hired'+lstHiredcandidate.size());
            
                     if(objJobDetail.Active__c==True)
                     {
                                
                                if(lstHiredcandidate.size()==objJobDetail.Positions__c)
                                {
                                     system.debug('conditaion block');
                                     objcan.Status__c.AddError('Sorry, No vacancies available for this Job');
                                }
                                else
                                {
                                    
                                }
                               
                     }
    }
    
   
}