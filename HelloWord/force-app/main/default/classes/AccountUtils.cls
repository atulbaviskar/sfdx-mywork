public class AccountUtils {

    public static list<Account> accountsByState(String st){
        List<Account> acctList=[SELECT Id,Name FROM Account WHERE billingState=:st];
        return acctList;
    }
}