({
	gotoURL : function(component, event, helper) { 
		var urlEvent = $A.get("e.force:navigateToURL");
		var recordId = component.get("v.recordId");

		 urlEvent.setParams(
			 { "url":
			 '/apex/pdf?&id='+recordId });
		  urlEvent.fire();
		 }
})