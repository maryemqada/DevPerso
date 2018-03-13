({
	onSearch : function(component, event) {
		var boatTypeID = component.get('v.boatTypeId');
        //alert('boat searchresult onsearch '+boatTypeID);
        if(boatTypeID == undefined ) boatTypeID = '';
       // alert(boatTypeID);
        
		var action = component.get("c.getBoats");
		 action.setParams({
             boatTypeID : boatTypeID
         });
        
            //add the callback behavior for when the response is received
            action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.boats", response.getReturnValue());
                console.log(response.getReturnValue());
                
                }
                else {
                console.log("Failed with state: " + state);
                }
            });

            //send action off to be executed
            $A.enqueueAction(action);	

	}
})