public with sharing class CloneQuote {
	@AuraEnabled
	public static void cloneQuote(ID quoteId) {
		Quote q1 =	

		[SELECT Name, OpportunityId, Pricebook2Id,
		(SELECT QuoteId, Description, Discount, PricebookEntryId,
				Quantity,Product2Id, UnitPrice FROM QuoteLineItems)
		FROM QUOTE WHERE ID = :QuoteId];
		
		Quote q2 = q1.clone();
		q2.Pricebook2Id = q1.Pricebook2Id;
	
		insert q2;
		Id idQuote = q2.id;


		List<QuoteLineItem> items = q1.QuoteLineItems;
		
		for (QuoteLineItem i : items){
			QuoteLineItem ql = new QuoteLineItem();
			ql.QuoteId = idQuote;
			ql.Description = i.Description;
			ql.Discount = i.Discount;
			ql.PricebookEntryId = i.PricebookEntryId;
			ql.Quantity = i.Quantity;
			ql.Product2Id = i.Product2Id; 
			ql.UnitPrice = i.UnitPrice;
			insert ql;
		}
 
	}
    @AuraEnabled
    public static Quote getQuote(Id recordId){
      Quote q = [ SELECT Name,AccountId, OpportunityId, Pricebook2Id FROM Quote WHERE Id =:recordId];
        System.debug(q);
    return q;
    }
}