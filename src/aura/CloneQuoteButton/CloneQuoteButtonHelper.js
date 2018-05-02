({
	getQuote : function(component,recordId) {
		var action = component.get("c.getQuote");
		
		debugger;
        action.setParams({
            "recordId": recordId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
               	JSON.stringify(response.getReturnValue());
              //  component.set("v.Quote", response.getReturnValue());
            return response.getReturnValue();
            }
        });
        $A.enqueueAction(action);
	}
})