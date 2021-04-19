global class DempBatch implements Database.Batchable<sObject>
{
               global Database.querylocator start(Database.BatchableContext BC)
               {
                     System.debug('Start ::'+BC); 
                     String query = 'SELECT Id,Salary__c  FROM Demo__c';
                     System.debug('query'+query); 
                     return Database.getQueryLocator(Query);
               }
 
               global void execute(Database.BatchableContext BC, List<Demo__c> scope)
               {
                 for(Demo__c objdemo:scope)
                 {
                     objdemo.Salary__c=objdemo.Salary__c+3;
                 }
                   update scope;
                   system.debug('update value'+scope);
               }
      
               global void finish(Database.BatchableContext BC)
               {
                   System.debug('SELECT FROM Demo__c WHERE Id !=Null LIMIT 50');
               }
       

}