@isTest 
private class LeadProcessorTest {
	 @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
		
		for (Integer i=0;i<200;i++) {
            leads.add(new Lead(lastname='lead '+i, 
               		 	company='4C FR'));
        }
        insert leads;
    }
	
	
	
	static testMethod void myUnitTest() {
        Test.startTest(); 
		 	LeadProcessor lp = new LeadProcessor();
		  	Id batchId = Database.executeBatch(lp);		 
	    Test.stopTest();
        
        System.assertEquals(200, [select count() from lead where leadSource='Dreamforce']);
        
    }
    
}