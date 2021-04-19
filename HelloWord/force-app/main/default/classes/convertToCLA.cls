public class convertToCLA {
    List<Contact> contacts;
    List<Lead> leads;
    List<Account> accounts;
    

    
    public void convertType(Integer phnu){
        List<List<sObject>> results = [FIND '4155557000' 
                                       IN Phone FIELDS 
                                       RETURNING Contact(Id, Phone, FirstName, LastName), 
                                       Lead(Id, Phone, FirstName, LastName), Account(Id, Phone, Name)];
        sObject[] records = ((List<sObject>)results[0]);
        
        System.debug('Sobject::'+records);
        
        if (!records.isEmpty()) {
            for (Integer i = 0; i < records.size(); i++) {
                sObject record = records[i];
                if (record.getSObjectType() == Contact.sObjectType) {
                     System.debug('record::'+record);
                     List<Contact> contacts = new List<Contact>();
                    contacts.add((Contact) record);
                        System.debug('contacts::'+contacts);
                } else if (record.getSObjectType() == Lead.sObjectType){
                    leads.add((Lead) record);
                       System.debug('leads::'+leads);
                } else if (record.getSObjectType() == Account.sObjectType) {
                    accounts.add((Account) record);
                     System.debug('accounts::'+accounts);
                }
            }
        }  
    }
}