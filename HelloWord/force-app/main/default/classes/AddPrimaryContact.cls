public class AddPrimaryContact implements Queueable  {
    
    private Contact contacts;
    private string state;
    public AddPrimaryContact(Contact records,string state){
        this.contacts = records;
        this.state = state;
    }         
    public void execute(QueueableContext context) {
        
        List<Account> ListAccount = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
        List<Contact> lstContact = new List<Contact>();
        for(Account acc:ListAccount)
        {
            contact cont = contacts.clone(false,false,false,false);
            cont.AccountId = acc.id;
            lstContact.add(cont);
        }
        if(lstContact.size()>0){
            insert  lstContact;
        }
     }
}