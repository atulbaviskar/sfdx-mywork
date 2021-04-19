global class MetadataServiceApi {
 global virtual class Metadata {
        public String fullName;
    }
     global class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    
     global class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    
     global class DebuggingHeader_element {
        public MetadataService.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    
     global class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    
     global class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    
     global class AllOrNoneHeader_element {
        public Boolean allOrNone;
        private String[] allOrNone_type_info = new String[]{'allOrNone','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'allOrNone'};
    }
    
     global class FieldOverride {
        public String field;
        public String formula;
        public String literalValue;
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] formula_type_info = new String[]{'formula','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] literalValue_type_info = new String[]{'literalValue','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'field','formula','literalValue'};
    }
    
     public class QuickActionLayout {
        public String layoutSectionStyle;
        public MetadataService.QuickActionLayoutColumn[] quickActionLayoutColumns;
        private String[] layoutSectionStyle_type_info = new String[]{'layoutSectionStyle','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] quickActionLayoutColumns_type_info = new String[]{'quickActionLayoutColumns','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'layoutSectionStyle','quickActionLayoutColumns'};
    }
    
    global class QuickActionLayoutColumn {
        public MetadataService.QuickActionLayoutItem[] quickActionLayoutItems;
        private String[] quickActionLayoutItems_type_info = new String[]{'quickActionLayoutItems','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'quickActionLayoutItems'};
    }
    global class ReputationBranding {
        public String smallImage;
        private String[] smallImage_type_info = new String[]{'smallImage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'smallImage'};
    }
     global class QuickActionSendEmailOptions {
        public String defaultEmailTemplateName;
        public Boolean ignoreDefaultEmailTemplateSubject;
        private String[] defaultEmailTemplateName_type_info = new String[]{'defaultEmailTemplateName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] ignoreDefaultEmailTemplateSubject_type_info = new String[]{'ignoreDefaultEmailTemplateSubject','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'defaultEmailTemplateName','ignoreDefaultEmailTemplateSubject'};
    }
    
     global class QuickActionLayoutItem {
        public Boolean emptySpace;
        public String field;
        public String uiBehavior;
        private String[] emptySpace_type_info = new String[]{'emptySpace','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] uiBehavior_type_info = new String[]{'uiBehavior','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'emptySpace','field','uiBehavior'};
    }
          webservice Static String test(){
            return 'result';
        }
     global class QuickAction {
        public String type = 'QuickAction';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String canvas;
        public String description;
        public MetadataService.FieldOverride[] fieldOverrides;
        public Integer height;
        public String icon;
        public Boolean isProtected;
        public String label;
        public String lightningComponent;
        public Boolean optionsCreateFeedItem;
        public String page_x;
        public MetadataService.QuickActionLayout quickActionLayout;
        public MetadataService.QuickActionSendEmailOptions quickActionSendEmailOptions;
        public String standardLabel;
        public String successMessage;
        public String targetObject;
        public String targetParentField;
        public String targetRecordType;
        public String type_x;
        public Integer width;
        private String[] canvas_type_info = new String[]{'canvas','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] fieldOverrides_type_info = new String[]{'fieldOverrides','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] height_type_info = new String[]{'height','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] icon_type_info = new String[]{'icon','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isProtected_type_info = new String[]{'isProtected','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] lightningComponent_type_info = new String[]{'lightningComponent','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] optionsCreateFeedItem_type_info = new String[]{'optionsCreateFeedItem','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] page_x_type_info = new String[]{'page','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] quickActionLayout_type_info = new String[]{'quickActionLayout','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] quickActionSendEmailOptions_type_info = new String[]{'quickActionSendEmailOptions','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] standardLabel_type_info = new String[]{'standardLabel','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] successMessage_type_info = new String[]{'successMessage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] targetObject_type_info = new String[]{'targetObject','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] targetParentField_type_info = new String[]{'targetParentField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] targetRecordType_type_info = new String[]{'targetRecordType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] width_type_info = new String[]{'width','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'canvas','description','fieldOverrides','height','icon','isProtected','label','lightningComponent','optionsCreateFeedItem','page_x','quickActionLayout','quickActionSendEmailOptions','standardLabel','successMessage','targetObject','targetParentField','targetRecordType','type_x','width'};
       
   
    }
    
  global class MetadataPort {
    public String endpoint_x = URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/38.0';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public MetadataService.MetadataPort MetadataPort;
        public MetadataService.SessionHeader_element SessionHeader;
        public MetadataService.DebuggingInfo_element DebuggingInfo;
        public MetadataService.DebuggingHeader_element DebuggingHeader;
        public MetadataService.CallOptions_element CallOptions;
        public MetadataService.AllOrNoneHeader_element AllOrNoneHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/2006/04/metadata';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/2006/04/metadata';
        private String AllOrNoneHeader_hns = 'AllOrNoneHeader=http://soap.sforce.com/2006/04/metadata';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata', 'MetadataService'};
        
        
  
        }
        
       

}