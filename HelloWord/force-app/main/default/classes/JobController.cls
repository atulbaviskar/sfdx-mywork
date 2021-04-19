public class JobController {

    
    public String selectedRT {get;set;}
    public List<SelectOption> recordTypeList {get;set;}
    public Job_Atul__c objOfJobs {get;set;}
     
    public JobController(){
     
        objOfJobs  = new Job_Atul__c();
        recordTypeList = new List<SelectOption>();
        getRecordTypeList();
     
    }
    
      public void getRecordTypeList(){
          
        List<RecordType> rtList = [SELECT Id,Name FROM RecordType ];
        recordTypeList.add(new SelectOption('--None--', '--None--'));
        for(RecordType rt : rtList)
        {
            recordTypeList.add(new SelectOption(rt.Id, rt.Name));
        }
    
    }
}