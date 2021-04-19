public class AccountInvocke {
@InvocableMethod(label='Get Account Names' description='Returns the list of account names corresponding to the specified account IDs.' category='Account')
  public static void getAccountNames(List<ID> ids) {
      System.debug('AccountIno::'+ids.size());
    
    List<Lead> accounts = [SELECT Name FROM Lead WHERE Id in :ids];
       for(lead a : accounts){ 
           a.firstname = 'true'; 
           
       } 
      System.debug('AccountInokk::'+accounts);
       update accounts; 
  }
}