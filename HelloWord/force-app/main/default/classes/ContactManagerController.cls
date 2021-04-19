public class ContactManagerController {

    public Contact objContact {get;set;}
    
    public ContactManagerController()
    {
         objContact=new Contact();
    }
    public PageReference saveRecords()
    {
         
          system.debug('ObjeConatct::'+objContact);
           HTTP http = new HTTP();
           HTTPRequest request = new HTTPRequest();
           insert objContact;
           PageReference pf = new PageReference('/' + objContact.id);
           pf.setRedirect(true);
           return pf;
      }
    
}