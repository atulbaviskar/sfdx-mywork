public class AccountTriggerHandler {

    private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    public static boolean IsFromBachJob ;
    public static boolean isFromUploadAPI=false;
   
    
     public AccountTriggerHandler(boolean isExecuting, integer size)
    {
        m_isExecuting = isExecuting;
        BatchSize = size;
    }
      
            

    public void OnBeforeInsert(List<Account> newAccount)
    {
        system.debug('Account Trigger On Before Insert'+newAccount);
    }
    public void OnAfterInsert(List<Account> newAccount)
    {
        system.debug('Account Trigger On After Insert');
    }
   
    
}