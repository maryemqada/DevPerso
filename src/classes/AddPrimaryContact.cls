public with sharing class AddPrimaryContact implements Queueable { 
	private contact contact;
    private string state;
     
    public AddPrimaryContact(contact contact, string state) {
        this.contact = contact;
        this.state = state;
    }
	
    public void execute(QueueableContext context) {
    	List<contact> liContacts = new list<contact>();
    	
        for(Account acc : [select id from account where BillingState = :state]){
        	contact con = contact.clone(false,false,false,false);
        	con.AccountID = acc.ID;
        	liContacts.add(con);	
        }
        
        insert liContacts;
    }
    
}