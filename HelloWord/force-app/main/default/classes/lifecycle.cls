public with sharing class lifecycle {

    private final Account acct;
    Integer EmpAdd;

    public lifecycle(myController controller) {
         System.debug('lifecycle::');
        this.acct = (Account)controller.getAccount();
    }

    public String getGreeting() {
           System.debug('getGreeting::');
        return acct.name + ' Current Information';
    }
    
    public void resetEmp() {
        System.debug('resetEmp::');
        acct.numberofemployees = 10;
        update acct;
    }
}