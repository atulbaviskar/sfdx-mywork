@isTest
public class ParkLocatorTest {
    
    @isTest static void TestCountry(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        list<string> lstparkNameByCountry = ParkLocator.Country('India');
        System.assertEquals(lstparkNameByCountry.size(),3);
    }
}