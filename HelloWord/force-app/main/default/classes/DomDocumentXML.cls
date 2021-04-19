public class DomDocumentXML{
    //parse response to xml
    public static void parseResponseDom(HttpResponse rep )
    {
           list<wrapAddress> recordlist; 
           recordlist = new list<wrapAddress>();
           DOM.Document doc=new DOM.Document();
           String results = rep.getBody();
           doc = rep.getBodyDocument();
           Dom.XMLNode rootNode = doc.getRootElement();
           for (Dom.XMLNode child: rootNode.getChildElements()) {
                                                                
                        if(child.getName()=='Rows'){
                            for(Dom.XMLNode child1: child.getChildElements())
                            {
                                if(child1.getAttributeCount() > 0)
                                {
                                    recordlist.add(new wrapAddress(child1));
                                }
                            }
                         }
                   }
        
           system.debug('record list::'+recordlist);
        
           //second request.
           for(integer i=0;i<recordlist.size();i++)
           {
               if(recordlist[i].Next=='Find')
               {
               setFinalAddress(recordlist[i].id);     
               }
               else
               {
                   return;
               }
           }
    }
    //Final requsest for address
    public static void setFinalAddress(string  id)
    {
              //Api Url    
              String  requestUrl = 'http://ws1.postescanada-canadapost.ca/AddressComplete/Interactive/Find/v2.10/xmla.ws?Key=WT86-PB79-HH56-TP95&Country=CANADA&SearchTerm=A1A1A&LastId='+id+'';
            
              //Http Request
              HttpRequest req = new HttpRequest(); 
              req.setEndpoint(requestUrl);
              req.setMethod('GET');
            
              //Http define object
              Http http = new http();
            
              //http reponse
              HttpResponse response = http.send(req);    
              String result=response.getBody();
              system.debug('Result::'+result);
    }
        //wrapper class
       public class wrapAddress 
       {
                //Variable decleartion for near by  address
                String Id{get;set;}
                String Text{get;set;}
                String Highlight{get;set;}
                String Description{get;set;}
                String Next{get;set;}
         
                public wrapAddress(Dom.XMLNode childelement){
         
                for(Integer i = 0; i< childelement.getAttributeCount(); i++)
                {
                   if(childelement.getAttributeKeyAt(i)=='Id')
                   {
                       this.Id=childelement.getAttributeValue(childelement.getAttributeKeyAt(i), childelement.getAttributeKeyNsAt(i));
                   }
                   else if(childelement.getAttributeKeyAt(i)=='Text')
                   {
                        this.Text=childelement.getAttributeValue(childelement.getAttributeKeyAt(i), childelement.getAttributeKeyNsAt(i));
                   }
                   else if(childelement.getAttributeKeyAt(i)=='Highlight')
                   {
                        this.Highlight=childelement.getAttributeValue(childelement.getAttributeKeyAt(i), childelement.getAttributeKeyNsAt(i));
                   }
                   else if(childelement.getAttributeKeyAt(i)=='Description')
                   {
                         this.Description=childelement.getAttributeValue(childelement.getAttributeKeyAt(i), childelement.getAttributeKeyNsAt(i));
                   }
                   else
                   {
                       this.Next=childelement.getAttributeValue(childelement.getAttributeKeyAt(i), childelement.getAttributeKeyNsAt(i));
                   }             
               }
      }
}
}