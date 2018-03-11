global with sharing class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, LeadSource ' +
            ' FROM Lead '
        );
    } 
    
     global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
        for (Lead lead : scope) {
        	lead.leadSource='Dreamforce';
        	leads.add(lead)	;
        }
       	
       	update leads;
     }
    
    global void finish(Database.BatchableContext bc){
    
    }
    
}