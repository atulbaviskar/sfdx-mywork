public class FetchCamping {
 
      @auraEnabled
    public static Camping_Item__c getAllcamping()
    {
     Camping_Item__c item=new Camping_Item__c();  
        item=[select Name,Price__c,Quantity__c,Packed__c from Camping_Item__c];
        system.debug('reg::'+item);
        return item;
    } 
    
}