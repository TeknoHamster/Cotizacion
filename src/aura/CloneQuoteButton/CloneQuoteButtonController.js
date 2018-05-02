({
    doInit :function(component, event, helper) {
        var recordId = component.get("v.recordId");
       var action = component.get("c.getQuote");
		
		
        action.setParams({
            "recordId": recordId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
               	JSON.stringify(response.getReturnValue());
                component.set("v.Quote", response.getReturnValue());
            
            }
        });
        $A.enqueueAction(action);
    },
    clonarQuote: function (component, event, helper) {
        var action = component.get("c.cloneQuote");
        var quoteId = component.get("v.recordId");
        debugger;
        action.setParams({
            "quoteId": quoteId
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {

            }
        });
        $A.enqueueAction(action);
    },
    handleSaveRecord: function (component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function (saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving record, error: ' +
                    JSON.stringify(saveResult.error));
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
    },
    createNewBoat: function (component, event, helper) {
        var recordId = component.get("v.recordId");
        var quote = component.get("v.Quote");
        
        var createRecordEvent = $A.get("e.force:createRecord");

     debugger;
        createRecordEvent.setParams({
            "entityApiName": "Quote",
            "defaultFieldValues": {
                'Name': quote.Name,
                'OpportunityId' : quote.OpportunityId,
                'AccountId' : quote.AccountId,
                'PriceBook2Id' : quote.PriceBook2Id
            }
        });


        createRecordEvent.fire();
    }

})