@isTest 
private class AddPrimaryContactTest {
	 @testSetup
    static void setup() {
        List<Account> liAccounts = new List<Account>();
		
		for (Integer i=0;i<50;i++) {
            liAccounts.add(new Account(
            			Name='Account '+i, 
               		 	billingstate='NY'));
        }
        
        for (Integer i=50;i<100;i++) {
            liAccounts.add(new Account(
            			Name='Account '+i, 
               		 	billingstate='CA'));
        }
        
        insert liAccounts;
    }
    
    static testMethod void myTest(){
    	
    	Test.startTest();
        	contact c = new contact(lastname='QADA');
        	AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
        	System.enqueueJob(apc);
        Test.stopTest();
        
        List<contact> c_lst = new List<contact>([select id from contact]);
        Integer size = c_lst.size();
        system.assertEquals(50, size);
    }
    
}