global class LightningButtonClass {

    @AuraEnabled
     webservice static void dnsCreditCheck(Id accId){
        
            set<Id> setId = new set<id>();
            if(accId != null){
                setId.add(accId);
            }
            if(setId.size() > 0){
                //updateDunsNumberCallout(setId);
            }
      
        
      }
}