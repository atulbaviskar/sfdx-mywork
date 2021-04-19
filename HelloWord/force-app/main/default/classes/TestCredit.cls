@isTest
public class TestCredit {

    public testmethod static void testData(){
        Account acc = new account(name ='test account1');
        insert acc;
        LightningButtonClass.dnsCreditCheck(acc.Id);
    }
}