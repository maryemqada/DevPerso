@isTest 
private class AnimalLocatorTest {	
    
	@isTest static void testPostCallout() {
	    // Set mock callout class
	    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
	    // This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock.
	    String responseStr = AnimalLocator.getAnimalNameById(1);
	    // Verify that the response received contains fake value
	   
	    System.assertEquals(responseStr,'chicken');
	}

}