public class AccountController {
    
    @AuraEnabled
    public static Account saveAccount (Account acc) {
        upsert acc;
        return acc;
    }
}