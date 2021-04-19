global class example implements iterable<Account>{
   global Iterator<Account> Iterator(){
       System.debug('Ex::');
      return new CustomAccountIterable();
   }
}