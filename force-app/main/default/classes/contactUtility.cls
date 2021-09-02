public with sharing class contactUtility {
    public contactUtility() {

    } 

    @AuraEnabled(cacheable=true)
    public static List<Contact> mycontacts(){
        
            return [SELECT id, FirstName, LastName FROM Contact LIMIT 10];
          
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> accountContacts(String recordId){
        return [SELECT id, FirstName, LastName FROM Contact WHERE AccountID =: recordId LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static list<Account> searchAccountNames(String searchkey){
        String key = '%' + searchKey + '%';
        return [SELECT ID,Name from Account WHERE name Like: key];
    }
}
