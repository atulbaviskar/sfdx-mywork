trigger ContactTrigger on Contact (after insert) {
    
    ContactTriggerHandler objcontacthandler=new ContactTriggerHandler();
    
    objcontacthandler.OnAfterInsert(Trigger.new);
}