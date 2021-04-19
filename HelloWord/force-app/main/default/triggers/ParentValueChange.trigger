trigger ParentValueChange on B__c (after insert) {

    
    system.debug(trigger.new);
}