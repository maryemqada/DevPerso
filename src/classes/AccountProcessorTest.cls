@isTest 
private class AccountProcessorTest {

    static testMethod void myUnitTest() {
        Account acc1 = new account(Name='Test 1');
        insert acc1;
        
        List<Contact> liCons =RandomContactFactory.generateRandomContacts(6,'QADA');
       	for(contact con : liCons)
       		con.accountID = acc1.id;
       
       insert liCons;
       	
       	Test.startTest(); 
		 	AccountProcessor.countContacts(new list<id>{acc1.id});
	    Test.stopTest();
        
        Account acc = [select Number_of_Contacts__c from account where id =:acc1.Id];
        System.assertEquals(acc.Number_of_Contacts__c,6);
        
    }
}