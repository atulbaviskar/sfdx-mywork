public class ContactTriggerHandler {
  
    public void OnAfterInsert(List<Contact> lstNewContacts)
    {
      
        
        Account objAccount = [SELECT Name FROM Account WHERE  Id =:lstNewContacts[0].AccountId];
       
       
        list<contact> lstContact = new list<contact>();
       
        lstContact=[SELECT id,FirstName FROM Contact WHERE Id=:objAccount.Id];
        system.debug('contact::'+lstContact[0].FirstName);
        lstContact[0].FirstName = objAccount.Name;
        system.debug('first::'+lstContact[0].FirstName);
        Update lstContact;

        system.debug(lstContact);
    }
    
}