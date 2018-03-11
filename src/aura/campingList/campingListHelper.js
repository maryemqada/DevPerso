({
   createItem: function(component, item) {
        this.saveItem(component, item, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
    },
    
    updateItem: function(component, item) {
        this.saveItem(component, item);
    },
    addItem: function(component, item) {
    this.saveItem(component, item, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            // all good, nothing to do.
         /*   var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);*/
        }
    });
},
    saveItem: function(component, item, callback) {
        var action = component.get("c.saveItem");
        console.log("Name of item to save: " + item.Name);
        action.setParams({
            "item": item
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        console.log(action.getParam("item"));
        $A.enqueueAction(action);
    }
})