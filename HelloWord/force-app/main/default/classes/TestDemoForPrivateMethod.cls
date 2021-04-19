public class TestDemoForPrivateMethod {

     @TestVisible  private  static Integer recordNumber = 1;
     @TestVisible  private  static integer updateRecord() {
         system.debug('Check');       
         return 1;	
    }

}