public class AddressComplete {

  
    //Method for set address as per country and search term
    public void setAddress(String STerm,String SCountry)
    {
             //Api Url    
              String  requestUrl = 'http://ws1.postescanada-canadapost.ca/AddressComplete/Interactive/Find/v2.10/xmla.ws?Key=WT86-PB79-HH56-TP95&Country='+SCountry+'&SearchTerm='+STerm+'';
            
              //Http Request
              HttpRequest req = new HttpRequest(); 
              req.setEndpoint(requestUrl);
              req.setMethod('GET');
            
              //Http define object
              Http http = new http();
            
              //http reponse
              HttpResponse response = http.send(req);
              //static method call 
              DomDocumentXML.parseResponseDom(response);
    }
    
}