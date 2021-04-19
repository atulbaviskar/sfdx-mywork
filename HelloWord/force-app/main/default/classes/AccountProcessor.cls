public class AccountProcessor {

    @future(callout=true)
    public static void countContacts(Set<id> setId){
        
        List<Account> lstAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :setId ];
        System.debug('lstAccount::'+lstAccount);
        
        for(Account acc : lstAccount){
            
            list<Contact> lstCont = acc.contacts;
            acc.Number_of_Contacts__c = lstCont.size();
        }
        update  lstAccount;
        
    }
    
}