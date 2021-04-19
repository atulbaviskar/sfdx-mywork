global class CandidateBatchScheduleOne  implements Schedulable{
   global void execute(SchedulableContext sc) {
       system.debug('test schedule');
       ListofCandidateBatchForMali  obj = new ListofCandidateBatchForMali();
       database.executebatch(obj);
       
       
   }
    Public static void SchedulerMethod() {
    string timeinterval = '0 1 * * * ?';
    System.schedule('BatchApexDemo-Every15mins',timeinterval, new CandidateBatchScheduleOne());
  }

}