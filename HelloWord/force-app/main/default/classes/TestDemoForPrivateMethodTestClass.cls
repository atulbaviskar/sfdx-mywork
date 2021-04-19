@isTest
public class TestDemoForPrivateMethodTestClass {

    public static testmethod void m1()
    {
          integer v=TestDemoForPrivateMethod.recordNumber;
          integer w=TestDemoForPrivateMethod.updateRecord();
        
          system.assertEquals(v,1);
          system.assertEquals(w,1);
    }
}