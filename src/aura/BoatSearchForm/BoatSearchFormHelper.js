({
	loadBoatTypes: function(component){
    //create the action
            console.log("Helper started");
            var action = component.get("c.getBoatTypes");

            //add the callback behavior for when the response is received
            action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.BoatTypes", response.getReturnValue());
                console.log(response.getReturnValue());
                }
                else {
                console.log("Failed with state: " + state);
                }
            });

            //send action off to be executed
            $A.enqueueAction(action);
       },
    helperMethod : function(component, event) {
		var action = component.get("c.getpickval");
		action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               // alert("From server: " + response.getReturnValue());
				component.set("v.BoatType", response.getReturnValue());            
            }           
        });
		$A.enqueueAction(action);	
	}
})