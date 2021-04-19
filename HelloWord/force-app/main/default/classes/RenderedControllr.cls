Public class RenderedControllr 
{
    
    public Demo__c objDemo{get;set;}
         
   Public RenderedControllr()
   {
       objDemo=new Demo__c();
      system.debug('Value'+objDemo);
   }
   Public PageReference saveDetail()
   {
       system.debug('VAlue'+objDemo);
       return  Null;   
   }
}