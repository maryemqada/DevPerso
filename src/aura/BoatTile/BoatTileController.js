({
	onBoatClick : function(component, event, helper) {
		var selectBoat = component.getEvent("BoatSelect");
		//alert('click');
		//alert(component.get("v.boat").Id);
		selectBoat.setParams({
		    boatId : component.get("v.boat").Id
		}).fire();
	}
})