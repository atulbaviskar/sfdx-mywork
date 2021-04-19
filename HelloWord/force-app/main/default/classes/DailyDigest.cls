global class DailyDigest implements Database.Batchable<sObject>,Database.Stateful
{ 
    public String query{get;set;}
    global map<id,list<Job_Atul__c>> mapContactWiseJob{get;set;}
    global map<id,list<Candidate_Atul__c>> mapjobWiseCanidate{get;set;}
    global List<Job_Atul__c> lstJobs{get;set;}
    global List<Candidate_Atul__c> lstCandidates{get;set;}
   
    global DailyDigest()
    {
          System.debug('Constructor');
          mapContactWiseJob=new map<id,list<Job_Atul__c>>();
          mapjobWiseCanidate= new map<id,list<Candidate_Atul__c>>();
          lstJobs=new list<Job_Atul__c>();
          lstCandidates=new list<Candidate_Atul__c>();
          
    }
    global Database.querylocator start(Database.BatchableContext BC)
    {
         string str='SELECT Id,Name,Manager__r.Id,Manager__r.Email,(SELECT Name,Job__c,First_Name__c,Last_Name__c FROM Candidate_Atuls__r) FROM Job_Atul__c WHERE Manager__r.Email != NULL AND ID IN (SELECT Job__c FROM Candidate_Atul__c)';
         return Database.getQueryLocator(str);
    }
    global void execute(Database.BatchableContext BC, List<Job_Atul__c> scope)
    { 
         integer i=0;
         System.debug('inside execute again::'+scope);
         for(Job_Atul__c objJob : scope)
         {
                lstJobs.add(objJob);
                mapContactWiseJob.put(objJob.manager__c,lstJobs); 
                mapjobWiseCanidate.put(objJob.id,objJob.Candidate_Atuls__r);
          }  
     }
    
     public String BodyFormat(List<Candidate_Atul__c> lst)
     {	
                       System.debug('BodyFormat');
                       System.debug('BodyFormat'+lst);
                       String str = '' ;
                       for(Candidate_Atul__c ObjCandidate : lst)
                       {
                           str += '<tr><td>'+ ObjCandidate.First_Name__c +'</td>'+'<td>'+ ObjCandidate.Last_Name__c +'</td>'+'</tr>' ;
                       }
                       str = str.replace('null' , '') ;
                       String finalStr = '' ;
                       finalStr = '<table border="1"> <td> First Name </td> <td> LastName </td> <td> Job Wise </td> <td> Candiadate </td> '+ str +'</table>' ;
                       return finalStr ;
     }
    
    global void finish(Database.BatchableContext BC)
    {
              System.debug('inside finish::');
              integer i=0;
          
              for(id ContactId:mapContactWiseJob.keySet())
              { 
                  for(Job_Atul__c objJobId:lstJobs)   
                     { 
                       if(objJobId.manager__C==ContactId)
                         {
                            Contact  lstContactEmail=[SELECT Email FROM Contact WHERE id=:ContactId]; 
                              
                                 if(mapjobWiseCanidate.containsKey(objJobId.Id))
                                 {
                                       String body = '' ;
                                       System.debug('mapjobWiseCanidate'+mapjobWiseCanidate);                                       System.debug('objJobId.Id'+objJobId.Id);
                                       list<Candidate_Atul__c> listcandidateforMail = mapjobWiseCanidate.get(objJobId.Id) ;
                                       System.debug('listcandidateforMail'+listcandidateforMail.size());
                                       body = BodyFormat(listcandidateforMail) ;
                                       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                                       String[] toAddresses = new String[] {lstContactEmail.Email};
                                       System.debug('toAddresses'+toAddresses);
                                       mail.setToAddresses(toAddresses);
                                       mail.setSubject('Candidate  Detail');
                                    
                                       mail.setHtmlBody('Details of Cases logged today is as follows :' + body + '<br/> Thanks');
                                       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                                       System.debug('Succefully');
                                 }       
                            
                         } 
                       
                     }
               }
 
           }
       
}