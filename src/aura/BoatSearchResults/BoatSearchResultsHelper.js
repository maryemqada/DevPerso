({
    onSearch : function(cmp){
       // debugger;
        var action = cmp.get("c.getBoats");
        //debugger;
        action.setParam({"boatTypeId":""});
        //debugger;
        action.setCallback(this, function(response){
            //debugger;
            var status = response.getState();
            if(status === "SUCCESS") {
                if(! $A.util.isEmpty(response.getReturnValue())){
                    cmp.set("v.boats",response.getReturnValue()); 
                } else {
                     cmp.set("v.recordError","No boats found");
                }
            }
        });
        $A.enqueueAction(action);
    }
})