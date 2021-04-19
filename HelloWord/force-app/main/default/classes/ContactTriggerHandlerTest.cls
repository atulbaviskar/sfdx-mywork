@isTest
public class ContactTriggerHandlerTest {

    static void setupTestData()
    {
        Account objAccount = new Account(Name='AAA');
        insert objAccount;       
        system.assert(objAccount.Id != NULL);
        
        Contact objContact = new Contact(FirstName='ABC',LastName='tayal',AccountId = objAccount.Id);
        insert objContact;
        system.assert(objContact.Id != NULL); 
    }
    @isTest
    static void checkContactFirstNameOnInsertionTests()
    {
        setupTestData();  
        List<Contact> lstContacts = [SELECT FirstName FROM Contact];
        system.assert(1==lstContacts.size());    
    }
    
}