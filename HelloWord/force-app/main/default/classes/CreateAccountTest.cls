@isTest
public class CreateAccountTest 
{
  static testMethod void testInsertAccount()
  {
       CreatingAccount ca = new CreatingAccount();
      Account obj=ca.createAccount('Shobit');
      system.assertEquals('Shobit',obj.Name);
  }
}