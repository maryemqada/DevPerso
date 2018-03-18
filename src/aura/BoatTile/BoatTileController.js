({
	onBoatClick : function(component, event, helper) {
		var BoatSelectEvent = component.getEvent('BoatSelect');
        var boat = component.get('v.boat');
        BoatSelectEvent.setParams({
            "boatId" : boat.Id
        });
        BoatSelectEvent.fire(); 
        
        //var BoatSelectedEvt = component.getEvent('boatselected');
        var BoatSelectedEvt = $A.get('e.c:boatselected');
        BoatSelectedEvt.setParams({
            "boat" : boat
        });        
        BoatSelectedEvt.fire();
        
       var plotMapMarker = $A.get('e.c:PlotMapMarker');
        plotMapMarker.setParams({
            "sObjectId":boat.Id,
            "lat" : "",
            "long":"",
            "label":""
            
        });   
        plotMapMarker.fire();
        
	}
})