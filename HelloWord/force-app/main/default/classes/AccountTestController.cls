public class AccountTestController {

     public string urlvalue{get;set;}
    
    public AccountTestController()
    {
        urlvalue=Apexpages.currentPage().getUrl();
        system.debug('urlvalue'+urlvalue);
    }
    
}