@isTest
public class AnimalLocatorTest {
    public testmethod static void testPostCallout(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        string result=AnimalLocator.getAnimalNameById(3);
        string expectedResult='chicken';
        System.assertEquals(result, expectedResult);
    }
}