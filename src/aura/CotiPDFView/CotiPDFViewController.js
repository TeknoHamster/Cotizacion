({
    displayQuote: function(component, event, helper) {
		var userkey = component.get('v.quote.quoteId');
		var userevent = $A.get("e.c:displayQuote");
        userevent.setParams({ "userId":  userkey});
        userevent.fire();
	}
    
})