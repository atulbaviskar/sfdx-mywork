trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    list<Task> lstTask =  new List<Task>();
    for(Opportunity obj : [SELECT Id,Name,StageName FROM Opportunity
                     WHERE Id IN :Trigger.New]){
                         if(obj.StageName=='Closed Won'){
                          lstTask.add(new Task(Subject='Follow Up Test Task',
                                          WhatId = obj.Id
                                          ));   
                         }
    }
    
    if(lstTask.size()>0)
        insert lstTask;
}