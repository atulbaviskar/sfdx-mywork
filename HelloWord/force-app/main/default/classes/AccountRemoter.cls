global with sharing class AccountRemoter {
    public static string message{get;set;} 
    public static string VariableForStoringAccountName {get;set;}
    public AccountRemoter(ApexPages.StandardController stdController) {
         //write any code which u want to execute at the start
    }
    public static void ShowGreeting() {
        message = 'Welcome to Extension demo' ;
    }
     public void mysave() {
        Account NewAccount = New Account();
        NewAccount.Name = VariableForStoringAccountName;
        NewAccount.industry = 'Chemical';
        insert NewAccount;
    
}
}