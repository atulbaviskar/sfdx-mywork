trigger AccountAddressTrigger on Account (before insert,before Update) {

    for(Account actNew :trigger.New)
    {
        if(actNew.Match_Billing_Address__c==true && actNew.BillingPostalCode!=null)
        {
			actNew.ShippingCity = actNew.BillingCity; 
			actNew.ShippingCountry = actNew.BillingCountry;
			actNew.ShippingPostalCode = actNew.BillingPostalCode;
			actNew.ShippingState = actNew.BillingState;
			actNew.ShippingStreet = actNew.BillingStreet;
        }
    }
}