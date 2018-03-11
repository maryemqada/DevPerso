({
	doInit : function(component, event, helper) {
		var action = component.get("c.getCosts");
		 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               var resultResp = response.getReturnValue();
				component.set("v.mapCosts", response.getReturnValue()) ;
            }
            else if (state === "ERROR") {
                var errors = response.getError();                
            }
        });

        $A.enqueueAction(action);
    
    },
    onSingleSelectChange: function(component, event, helper){
  		var key = (component.find("InputSelectSingle1").get("v.value")+component.find("InputSelectSingle2").get("v.value")).toUpperCase();
        var map1 = new Map();
		map1 = component.get("v.mapCosts") ; 
        
        var listCost = 
        component.set("v.cost",map1[key]);

	}
})