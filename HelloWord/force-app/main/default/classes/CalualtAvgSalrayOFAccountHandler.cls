public class CalualtAvgSalrayOFAccountHandler {

    public static void calAvgSalray(List<Contact> lstContact){
        list<Account> lstAccount = new List<Account>();
        set<Id> setAccId =  new set<Id>();
        if(lstContact.size()>0){
            
            for(Contact objCon : lstContact){
                setAccId.add(objCon.accountId);
            }
            if(setAccId.size()>0){
                
                List<Account> lstAccounts = [SELECT ID,Name FROM Account where Id IN : setAccId] ;
                List<Contact> lstContacts = [SELECT ID,Name FROM Contact where accountId IN : setAccId] ;
                
                for(Account objAcc :lstAccounts){
                    integer total = 0;
                    integer conCount = 0;
                    for(Contact objCon : lstContacts){
                        if(objAcc.id == objCon.accountId){
                        total  = total + 0;
                        conCount = conCount++;
                       }
                    }   
                      lstAccount.add(objAcc) ;
                 }
                   // objAcc.AVg_Salray__C  = total / conCount;
                  
                }
                if(lstAccount.size()>0)
                    update lstAccount;
        }
    }
}