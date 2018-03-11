global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
    	list<Lead> liLeadsToUp = new list<Lead>();
    	
    	for(Lead ld : [select LeadSource  from lead where LeadSource ='' limit 200]){
    		ld.LeadSource ='Dreamforce';
    		liLeadsToUp.add(ld);
    	}
    	update liLeadsToUp;
    }

    
}