({
    onInit : function(component,event) {
    console.log('oooooooooon');
        component.find("service").getNewRecord(
            "BoatReview__c", // sObject type (entityAPIName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.boatReview");
                var error = component.get("v.recordError");
                var boat=component.get("v.boat");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    component.set("v.boatReviewRecord.Boat__c",boat.Id);
                    component.set("v.boatReview.Boat__c",boat.Id);
                   console.log('--- AddBoatReview->OnInit Helper : boatID '+  component.get("v.boatReviewRecord.Boat__c") +'-'+ component.get("v.boatReview.Boat__c"));
                }
            })
        );
    }
})