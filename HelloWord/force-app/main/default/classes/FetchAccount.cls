public class FetchAccount {
    
    @AuraEnabled
    public static List<Account> getAccountList(){
        List<Account> lstAccount=[SELECT Id,Name,Industry,AccountNumber FROM Account LIMIT 10];
        system.debug('lstAccount::'+lstAccount);
        return lstAccount;
    }
}