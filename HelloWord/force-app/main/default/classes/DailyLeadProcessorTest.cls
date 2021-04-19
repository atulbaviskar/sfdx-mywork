@isTest
public class DailyLeadProcessorTest {
    
    public testmethod static void testUpdateLeadSchedule(){
        List<Lead> lstLed =  new List<Lead>();
        String CRON_EXP = '0 0 10 ? * *';
        for(integer i = 0 ;i<200;i++ ){
            lstLed.add(New Lead(lastname = 'Test'+i,Company='Test AB'));
        }
        insert lstLed;
        Test.startTest();
        System.schedule('ScheduledApexTest',
                        CRON_EXP, 
                        new DailyLeadProcessor());  
        Test.stopTest();
    }
}