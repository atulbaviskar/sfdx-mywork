trigger MaintenanceRequest on Case (before update, after update) {
    Map<id,Case>  caseLst = new Map<id,Case>();
    
    if(Trigger.isUpdate &&  Trigger.isAfter){
        for(Case oCase: Trigger.new){
            if(oCase.IsClosed && (oCase.Type.equals('Repair') || oCase.Type.equals('Routine Maintenance'))){
                caseLst.put(oCase.Id, oCase);
            }
        } 
        if(caseLst.size()>0){
            MaintenanceRequestHelper.updateWorkOrders(caseLst); 
        }
    }
    
}