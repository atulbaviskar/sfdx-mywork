public class AnimalLocator {
    
    public static string getAnimalNameById(integer id){
        Http http= new Http();
        HttpRequest request =  new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String strResp = '';
        if (response.getStatusCode() == 200) {
            Map<String,Object> animals = new Map<String,Object>();
            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('results::'+results);
            
            animals = (map<string,object>) results.get('animal');
            strResp = (string)animals.get('name');
            System.debug('animals::'+animals);
        }
        return strResp;
    }
}