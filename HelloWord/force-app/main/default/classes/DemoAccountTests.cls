@isTest
public class DemoAccountTests {

    @isTest static void setAccountAndContactDetail()
    {
        Account objAccount=new Account(Name='TCS',Website='www.tcs.com');
        insert objAccount;
        system.debug('account detail'+objAccount);
        Contact objContact=new Contact(FirstName='Ramanuj',LastName='Patel',AccountId=objAccount.Id);
        insert objContact;
        system.debug('candidate detail'+objContact);
        list<Contact> lstcontact=DemoAccount.lstOfContactByAccountWebiste(objAccount.Website);
        system.debug(lstcontact);
        system.assertEquals(objContact.Id, lstcontact[0].Id);    
    }
}