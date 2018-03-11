trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	
	List<Task> taskList = new List<Task>();
	//bulk mode
	for(Opportunity opp : Trigger.new){
		if(opp.StageName =='Closed Won'){
			taskList.add(new task(
				Subject = 'Follow Up Test Task',
				Status = 'Open',
				Priority = 'Normal',
				WhatId = opp.Id
			));
		}
	}//end for bulk
	
	insert taskList;
}