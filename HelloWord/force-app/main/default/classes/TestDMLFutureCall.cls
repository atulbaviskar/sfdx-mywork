public class TestDMLFutureCall {
    
    @future 
    public static void processAccount() {
         List<Account> lstAccount = [select id,Name
                from Account LIMIT 10];
        for(Account c: lstAccount){
            System.debug('Contact Id[' + c.Id + '], FirstName[' + c.Name + ']');
            c.Name= c.Name + 'Future'; 
            update c;   
        }
    }   
}