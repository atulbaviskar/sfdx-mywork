@isTest
public class AccountTriggerHandlerTest {
    
    //list of account object.
    static list<Account> lstAccount=new list<Account>();         
    
    //test Account Trigger.
    static testMethod void testAccountTrigger()
    {
            Account testAccount = new Account( Name = 'D-Mart' );
            insert testAccount;
            testAccount = [select Id, Name from Account where Id = :testAccount.Id];
            System.assertEquals(testAccount.Name, 'D-Mart'); 
               
    }
}