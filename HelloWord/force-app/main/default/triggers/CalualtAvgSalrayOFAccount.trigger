trigger CalualtAvgSalrayOFAccount on Contact (after insert) {

    if(trigger.isinsert){
        CalualtAvgSalrayOFAccountHandler.calAvgSalray(trigger.new);
    }
}