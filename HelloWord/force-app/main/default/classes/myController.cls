public with sharing class myController {

    private final Account account;

      public myController() {
          System.debug('myController::');
            account = [select id, name, site, NumberOfEmployees, Industry from Account 
                       where id = :ApexPages.currentPage().getParameters().get('id')];
      }

      public Account getAccount() {
          System.debug('getAccount::'+account);
            return account;
      }

      public PageReference save() {
            update account;
            return null;
      }

      public PageReference cancel() {
            return null;
      }
}