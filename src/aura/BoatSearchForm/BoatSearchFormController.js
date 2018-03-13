({
	doInit : function(component, event, helper) {
      /*  component.set("v.displayNew", $A.get("e.force:createRecord"));
      
        helper.helperMethod(component, event);
        */
         helper.loadBoatTypes(component);

	},
    onFormSubmit : function(component, event, helper){
        console.log("event received by BoatSearchController.js");
        
       /* var formData = event.getParam("formData");
        var boatTypeId = formData;//formData.boatTypeId;
        var BSRcmp = component.find("BSRcmp");
        var auraMethodResult = BSRcmp.search(boatTypeId);
        console.log("auraMethodResult: " + auraMethodResult);
        */
         var boatTypeId = component.get("v.selectedType");
        alert('onFormSubmit' + boatTypeId);
        var formSubmit = component.getEvent("formsubmit");
        formSubmit.setParams({"formData":
                            {"boatTypeId" : boatTypeId}
        });
        formSubmit.fire();
        
        
        
        
        
        
        
    },
    newItem: function(component, event, helper) {
    	var createBoatTypeEvent = $A.get("e.force:createRecord");
        //if (createBoatTypeEvent) {
            //var createBoatTypeEvent = $A.get("e.force:createRecord");
        	createBoatTypeEvent.setParams({
                "entityApiName": "Boat__c"/*,
                "defaultFieldValues": {
                    'BoatType__c' : (component.get("v.selectedBoatType") !=null ? component.get("v.selectedBoatType") :'')
                }*/
            });
            createBoatTypeEvent.fire(); 
                //alert(isEnabled);
                //console.log(isEnabled);
            component.set("v.displayNew", true);
        //  } 
    },
    searchItems: function(component, event, helper) {
        
    },
    setBoatType: function(component, event, helper) {        
    	component.set("v.selectedBoatType", component.find("BoatTypePicklist").get("v.value"));    
   	//	alert(component.get("v.selectedBoatType"));
    },////////////////////////////////
    
    handleChange : function(component, event, helper){
        console.log(component.find("boatTypes").get("v.value"));
        component.set("v.selectedType", component.find("boatTypes").get("v.value"));
    },

    search : function(component, event, helper){
        var selectedType = component.get("v.selectedType");
        alert("Search button pressed " + selectedType)
    },

    newBoat : function(component, event, helper){
        var boatTypeId = component.get("v.selectedType");
        console.log("New button pressed " + boatTypeId);
        var requestNewBoat = component.getEvent("launchNewBoatForm");
        requestNewBoat.setParams({"boatTypeId": boatTypeId});
        requestNewBoat.fire();
    },

    handleNewBoatForm: function(component, event, helper){
        console.log("handleNewBoatForm handler called.")
        var boatTypeId = component.get("v.selectedType");

        console.log(boatTypeId);
        var createNewBoat = $A.get("e.force:createRecord");
        createNewBoat.setParams({
            "entityApiName": "Boat__c",
        })
        if(! boatTypeId==""){
            createNewBoat.setParams({
                "defaultFieldValues": {'BoatType__c': boatTypeId}
           })
        }
        createNewBoat.fire();
    }
})