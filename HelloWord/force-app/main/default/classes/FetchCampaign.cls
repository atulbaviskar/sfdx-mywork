public class FetchCampaign {
 @auraEnabled
    public static List<Campaign> getAllregistrations()
    {
     List<Campaign> reg=new LIST<Campaign>();  
        reg=[select id,Name from Campaign];

        return reg;
    } 
    public Expense__c getSelectedregistrations(Id id)
    {    
      Expense__c  reg=[select id,Name from Expense__c where id=:id];
        
        return reg;
    } 
}