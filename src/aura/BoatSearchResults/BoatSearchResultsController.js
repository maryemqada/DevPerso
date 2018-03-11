({
	doInit : function(component, event, helper) {
    	helper.onSearch(component);
    },
    search: function(component, event, helper){
        var params = event.getParam('arguments');
        alert("boatTypeId extracted: " + params.boatTypeId);
        component.set("v.boatTypeId", params.boatTypeId);
        helper.onSearch(component);
        return "search complete.";
    }
})