public class DemoAccount {

    public static list<Contact> lstOfContactByAccountWebiste(String web)
    {
        system.debug(web);
        list<Account> objAccountId=[SELECT ID FROM ACCOUNT WHERE  Website=:web];
        system.debug('account Id'+objAccountId);
        list<Contact> contactId=[SELECT ID FROM Contact WHERE AccountId =:objAccountId[0].ID];
         system.debug('Contact Id'+contactId);
        return contactId;
    }
}