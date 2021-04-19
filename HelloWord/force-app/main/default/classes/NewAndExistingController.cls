public class NewAndExistingController {
    public Account account{get;set;}
    public NewAndExistingController()
    {
        Id id=ApexPages.currentPage().getParameters().get('id');
        system.debug('id::'+id);
         account = (id == null) ? new Account() :
            [SELECT Name, Phone, Industry FROM Account WHERE Id = :id];
                 system.debug('account::'+account);
    }
     public PageReference save()
     {
        try {
            upsert(account);
        } catch(System.DMLException e) {
         ApexPages.addMessages(e);
            return null;
        }
        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return (redirectSuccess);
    }
}