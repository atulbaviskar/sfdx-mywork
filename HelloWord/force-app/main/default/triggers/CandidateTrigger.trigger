trigger CandidateTrigger on Candidate_Atul__c (after update,after insert,before insert) {
    
   
    
   /*  if(Trigger.isUpdate && Trigger.isAfter )
     {
        
            CandidateTriggerHandler.OnDecativeJobForAppliedCandidate(Trigger.new);
     }  */
     /*if(Trigger.isInsert && Trigger.isAfter )
     {
         
           CandidateTriggerHandler.OnNotAllowCandidateForDeactiveJob(Trigger.New);
            
     }*/
    /* if(Trigger.isInsert && Trigger.isBefore )
     {
         
           CandidateTriggerHandler.OnNotAllowCandidateForDeactiveJob(Trigger.New);
            
     }*/
}