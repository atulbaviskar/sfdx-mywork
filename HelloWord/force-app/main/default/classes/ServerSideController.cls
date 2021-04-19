public class ServerSideController {

    @AuraEnabled
    public static String getAnAccountName(){
        list<Account> alist = [SELECT Name FROM Account LIMIT 1];
        if ( alist.size() == 0 ) {
            AuraHandledException e = new AuraHandledException('No Accounts Found');
            e.setMessage('No Accounts Found');
            throw e;
        }
        return alist[0].Name;
    }

}