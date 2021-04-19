@isTest
public class TestRestrictContactByName {
    
    @isTest static void TestRestrictContactByNames(){
        
        /*    Contact  objcontact = new Contact (FirstName = 'xyzFirst',
LastName = 'INVALIDNAME',
Account = objAccount,
Email = 'xyzmail@mail.com');
Test.startTest();
Database.SaveResult result = Database.insert(objcontact, false);
Test.stopTest();
System.debug('SaveResult::'+result);
System.assert(!result.isSuccess());
System.assert(result.getErrors().size() > 0);
System.assertEquals('"The Last Name "'+objcontact.LastName+'" is not allowed for DML"',
result.getErrors()[0].getMessage());*/
    }
    @isTest static void TestgenerateRandomContacts(){
        list<contact> lstcnt = RandomContactFactory.generateRandomContacts(2, 'Test');
        System.debug('lstcnt:'+ lstcnt);
        System.assertEquals(lstcnt.size(), 1);
    }
     @isTest static void TestgenerateRandomNotInsertContacts(){
        list<contact> lstcnt = RandomContactFactory.generateRandomContacts(2, null);
        System.debug('lstcnt:'+ lstcnt);
        System.assertEquals(lstcnt.size(), 1);
    }
}