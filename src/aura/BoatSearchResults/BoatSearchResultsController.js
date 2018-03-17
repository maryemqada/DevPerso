({
	onSearch : function(component, event, helper) {
		helper.onSearch(component);
	},
    
    doSearch: function(component, event, helper){
        console.log("BSRController: search called");
        var params = event.getParam('arguments');
        console.log("boatTypeId extracted: " + params.boatTypeId);
        component.set("v.boatTypeId", params.boatTypeId);
        helper.onSearch(component);
        return "search complete.";
    },
    
    onBoatSelect: function(component, event, helper){
        var params = event.getParam();
        component.set("v.selectedBoatId", params.boatId);
    }
})