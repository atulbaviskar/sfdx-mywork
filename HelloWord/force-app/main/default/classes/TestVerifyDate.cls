@isTest
public class TestVerifyDate {
    @isTest static void CheckDatesDate2GreterThanDate1(){
        Date myDate = Date.newInstance(1960, 2, 17); 
        System.debug('myDate::'+myDate);
        Date myDateOne = Date.newInstance(1960, 3, 17); 
        System.debug('myDateOne::'+myDateOne);
        Date TestDate = VerifyDate.CheckDates(myDate, myDateOne);
        System.debug('TestDate::'+TestDate);
    }
     @isTest static void CheckDatesDate1GreterThanDate2(){
        Date myDate = Date.newInstance(1960, 3, 17); 
        System.debug('myDate::'+myDate);
        Date myDateOne = Date.newInstance(1960, 2, 17); 
        System.debug('myDateOne::'+myDateOne);
        Date TestDate = VerifyDate.CheckDates(myDate, myDateOne);
        System.debug('TestDate::'+TestDate);
    }
}