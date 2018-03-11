({
    handleSaveRecord: function(component, event, helper) {
        
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
                component.set("v.recordSaveError", "");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                var errMsg = "";
                // saveResult.error is an array of errors, 
                // so collect all errors into one message
                for (var i = 0; i < saveResult.error.length; i++) {
                    errMsg += saveResult.error[i].message + "\n";
                }
                component.set("v.recordSaveError", errMsg);
            } else {
                component.set("v.recordSaveError", "");
            }/* else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }*/
        }));}
})