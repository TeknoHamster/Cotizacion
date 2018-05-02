public with sharing class ViewQuotePDF {
	@AuraEnabled
	public static String getPDF(){
		list<Quote> quotes = new list<Quote>();
		String pfdBase64;
		Blob b;

		for (Quote q:	[SELECT Name FROM Quote]){
			quotes.add(q);
		}

		if (quotes.isEmpty()){
			System.debug('lista vacia');
		}else{
			for(Quote q : quotes){
				System.debug('nombre de la quote: '+q.Name);
				 b = Blob.toPdf(ViewQuotePDF.StringPDF(q));
			}
			list<Attachment> attachements = [SELECT Body FROM Attachment WHERE ParentId = :quotes.get(0).Id];

			System.debug('before blob to string');

		}
		
	
	
		return EncodingUtil.base64Encode(b);

	
	}

	public ViewQuotePDF() {
		
	}
	public static String StringPDF(Quote quote){
		return 
		'<div>'+quote.Name+'</div>';
	}
}