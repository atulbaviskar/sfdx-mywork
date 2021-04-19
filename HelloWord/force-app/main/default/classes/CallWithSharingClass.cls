public inherited sharing class CallWithSharingClass {

    public static list<Account> TestAcc(){
       list<Account>  accListd = new list<Account>();
        accListd   = [Select Id,Name,Type from Account];
        return accListd;
    }
}