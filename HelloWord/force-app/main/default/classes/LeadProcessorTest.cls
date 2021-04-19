@isTest
public class LeadProcessorTest {

     @testSetup 
    static void setup() {
        List<Lead> lstLead = new List<Lead>();
  
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            lstLead.add(new Lead(lastname='Lead '+i, 
                Company='Test AB', Status='Working - Contacted',LeadSource = 'Dreamforce'));
        }
        insert lstLead;
    }
     static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}