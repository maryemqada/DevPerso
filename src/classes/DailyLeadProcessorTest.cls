@isTest 
private class DailyLeadProcessorTest {
	@testSetup 
    static void setup() {
    	List<Lead> liLeads = new List<Lead>();
		
		for (Integer i=0;i<200;i++) {
            liLeads.add(new Lead(
            			lastName='Lead '+i, 
               		 	company='4C FR'+i));
        }     
        
        insert liLeads;	
    }
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    static testMethod void myTest(){
    	Test.startTest();
    	// Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new DailyLeadProcessor());         
        // Verify the scheduled job has not run yet.
        List<Lead> lt = [SELECT Id 
            FROM Lead 
            WHERE Leadsource ='Dreamforce'];
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that our tasks were created
        lt = [SELECT Id 
            FROM Lead 
            WHERE Leadsource ='Dreamforce'];
        System.assertEquals(200,
            lt.size(),
            'Tasks were not created');
    		
    }
    
}