@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {

    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
  
    @HttpGet
    global static Account doGet() {
        System.debug('Request::'+RestContext.request);
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
         System.debug('RestResponse::'+RestContext.response);
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
  
  @HttpPost
    global static String doPost() {
       Map<string,Object> fieldMap = null;
        fieldMap = (Map<string,Object>)JSON.deserializeUntyped(RestContext.request.requestBody.tostring());
       
         System.debug('Request::'+RestContext.request.requestURI);
        System.debug('Request::'+RestContext.request);
         System.debug('str::'+fieldMap);
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get('A__c');
        System.debug('targetType::'+targetType);
        SObject newSobject = targetType.newSObject();
        System.debug('newSobject::'+newSobject);
        Map<String,Schema.SObjectField> targetFields = targetType.getDescribe().fields.getMap();
        System.debug('targetFields::'+targetFields);
        for(String key : fieldMap.keySet()){
           System.debug('key::'+key);
            Object value = fieldMap.get(key);
             System.debug('Bolb::'+Blob.valueof('TestUUU'));
             System.debug('value::'+value);
            Schema.DisplayType valueType = targetFields.get(key).getDescribe().getType();
             System.debug('valueType::'+valueType);
            newSobject.put(key, Double.valueOf(value));
             System.debug('newSobject::'+newSobject);
        }
       insert newSobject;
        return Blob.valueof('TestUUU').tostring();
    }
}