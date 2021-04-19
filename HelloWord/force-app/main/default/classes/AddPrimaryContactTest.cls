@IsTest
public class AddPrimaryContactTest {
    
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState = 'NY'
            ));
        }
        
        
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState = 'CA'
            ));
        }
        insert accounts;
    }
    static testmethod void testQueueable() {
        
        
        Contact co = new Contact();
        
        co.FirstName='demo';
        
        co.LastName ='demo';
        
        insert co;
        
        String state = 'CA';
        
        AddPrimaryContact apc = new AddPrimaryContact(co, state);
        
        Test.startTest();        
        System.enqueueJob(apc);
        Test.stopTest();   
        System.assertEquals(50, [select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = :state)]);  
        
    }
}