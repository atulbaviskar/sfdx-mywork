global class CustomAccountIterable implements Iterator<Account>{ 

   List<Account> accs {get; set;} 
   Integer i {get; set;} 

   public CustomAccountIterable(){ 
       accs = 
       [SELECT Id, Name, 
       NumberOfEmployees 
       FROM Account 
       WHERE Name = 'false']; 
       i = 0; 
   }   

   global boolean hasNext(){ 
        System.debug('hasNext::'+ i);
        System.debug('hasNext size::'+ accs.size());
       if(i >= accs.size()) {
           return false; 
       } else {
           return true; 
       }
   }    

   global Account next(){ 
      
       if(i == 8){return null;} 
       i++; 
       System.debug('Account::'+ accs[i-1]);
       return accs[i-1]; 
   } 
}