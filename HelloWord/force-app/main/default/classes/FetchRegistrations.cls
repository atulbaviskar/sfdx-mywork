public class FetchRegistrations  {
    @auraEnabled
    public static List<Expense__c> getAllregistrations()
    {
     List<Expense__c> reg=new LIST<Expense__c>();  
        reg=[select id,Name,Amount__c,Client__c,Date__c from Expense__c];
        system.debug('reg::'+reg);
        return reg;
    } 
    public Expense__c getSelectedregistrations(Id id)
    {    
      Expense__c  reg=[select id,Name from Expense__c where id=:id];
        
        return reg;
    } 
   
}