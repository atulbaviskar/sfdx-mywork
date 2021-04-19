public inherited sharing class DisplayContact {
    public List<Account> accList {get;set;}
    public DisplayContact(){
        
    }
    public static list<Account> lstAccc(){
       list<Account>  accListd = new list<Account>();
        accListd   = [Select Id,Name,Type from Account];
      return accListd;
    }
    public PageReference ContactLists()
    {
      accList = [Select Id,Name,Type from Account];
      return null;
    }   

}