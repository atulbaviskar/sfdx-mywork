trigger TestDebugLog on Account (after insert) {
        
       System.debug('Test Debug log::'+trigger.new);
}