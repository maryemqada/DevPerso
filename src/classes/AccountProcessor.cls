public with sharing class AccountProcessor {
    @future 
    public static void countContacts(List<Id> liAccountIds){
    	List<account> liAccToUpdate = new list<Account>();
    	
    	for(Account acc :[select id, (select id from Contacts) 
    						from account
    						 where id in :liAccountIds]){
    		if(acc.contacts.size()>0){
    			acc.Number_of_Contacts__c = acc.contacts.size();
    			liAccToUpdate.add(acc);		
    		}//end if    			
    	}//end for bulk
    	update liAccToUpdate;
    }
}