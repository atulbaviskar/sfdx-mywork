trigger StudentUpdate on Student__c (after update) {

    System.debug('TestFire');
    System.debug('trigger Old::'+trigger.old);
    System.debug('trigger New::'+trigger.New);
    LIST<Student__c> lstold=new list<Student__c>(trigger.old);
    LIST<Student__c> lstnew=new list<Student__c>(trigger.new);
    System.debug('lstold::'+lstold);
    System.debug('lstnew::'+lstnew);
    if(lstold[0].feesAMT__c!=lstnew[0].feesAMT__C)
    System.debug('Fire::'+lstnew[0].TestDemo__c);
}