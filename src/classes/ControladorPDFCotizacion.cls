public  class ControladorPDFCotizacion {
	private final Quote quote;
	
	public ControladorPDFCotizacion(ApexPages.StandardController stdController){
		this.quote = (Quote)stdController.getRecord();
	}
		
	
}