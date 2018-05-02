/**
 * Testing the ability to convert a string to a PDF file.
 */
@isTest
public class testBlobToPDF 
{

    public static testMethod void testBlobPDF() 
    {
        string PDFBody = testBlobToPDF.Body();
        Blob pdfBlob = Blob.toPDF(PDFBody);
        testBlobToPDF.SaveBlobToDoc(pdfBlob);
    }
    
    public static void SaveBlobToDoc (Blob blobPDF)
    {
    	string FileName = 'TestPDF';
    	Document doc;
    	list<Document> docs = [Select ID, Name, Body, FolderID, DeveloperName, Type, ContentType From Document Where Name = :FileName];
    	if (docs.size() > 0)
    		doc = docs[0];
    	else
    	{
    		doc = new Document();
    		doc.Name = FileName;
    		doc.DeveloperName = FileName;
    		doc.Type = 'pdf';
    		doc.ContentType = 'application/pdf';
    		doc.FolderId = UserInfo.getUserId();  //PLaces this into the persons Personal Folder
    	}
    	
    	doc.Body = blobPDF;
    	upsert doc;
    }
    
    public static string Body()
    {
    	string bodyStr = 
'    <div style="position: absolute; width: 8.0459in; height: 10.1124in; font-family: Verdana; font-size: 11.0pt">' + 
'      <table width="100%" border="0" cellspacing="0" cellpadding="2" style="font-weight: bold">	' +
'        <tr>	' +
'            <td width="35%" style="vertical-align: top" align="left">	' +
'                Appointment For: 4/5/2012  1:00 PM	' +
'            </td>	' +
'            <td width="35%" style="vertical-align: top" align="left">	' +
'                improveit! 360, Dev0	' +
'            </td>	' +
'            </tr>' +
'       </table>' +
'    <table width="100%" cellspacing="0" cellpadding="2">	' +		
'        <tr>			' +
'            <td width="45%" style="vertical-align: top">		' +	
'                <table width="100%" border="0" cellspacing="0" cellpadding="2">		' +	
'                    <tr>			' +
'                        <td style="vertical-align: top" width="25%" >			' +
'                            Name(s):			' +
'                        </td>			' +
'                        <td  width="75%" >			' +
'                            Christopher Miller	' +	
'                        </td>			' +
'                    </tr>			' +
'                    <tr>			' +
'                        <td style="vertical-align: top" width="25%" >			' +
'                            Address:			' +
'                        </td>			' +
'                        <td  width="75%" >			' +
'                            420 Pine Blvd.<br />			' +
'                            Stockton-515887724, VA 43201<br />			' +
'                        </td>			' +
'                    </tr>			' +
'                    <tr>			' +
'                        <td style="vertical-align: top" width="25%" >			' +
'                            Phone(s):			' +
'                        </td>' +			
'                        <td  width="75%" >' +			
'                            (234) 373-8468 Home<br />' +			
'                            (233) 246-8194 Home<br />' +			
'                             			' +
'                        </td>			' +
'                    </tr>' +			
'                </table>' +			
'            </td>' +			
'            <td width="45%" style="vertical-align: top">' +			
'                <table width="100%" cellspacing="0" cellpadding="2" style="border: 1px solid black;">' +			
'                    <tr>' +			
'                        <td style="vertical-align: top" width="25%" >' +			
'                            Status:' +			
'                        </td>' +			
'                        <td  width="75%" >' +			
'                            Assigned' +			
'                        </td>' +			
'                    </tr>' +			
'                    <tr>' +			
'                        <td style="vertical-align: top" width="25%" >' +			
'                            Type:' +			
'                        </td>' +			
'                        <td  width="75%" >' +			
'                            New			' +
'                        </td>' +			
'                    </tr>' +			
'                    <tr>' +			
'                        <td style="vertical-align: top" width="25%" >' +			
'                            Date / Time:' +			
'                        </td>' +			
'                        <td  width="75%" >' +			
'                            4/5/2012  1:00 PM' +			
'                        </td>' +			
'                    </tr>' +			
'                    <tr>' +			
'                        <td style="vertical-align: top" width="25%" >' +			
'                            Duration:' +			
'                        </td>' +			
'                        <td  width="75%" >' +			
'2' +			
'                        </td>' +			
'                    </tr>' +			
'                    <tr>' +			
'                        <td style="vertical-align: top" width="25%" >' +			
'                            Rep 1:' +			
'                        </td>' +			
'                        <td  width="75%" >' +			
'                            Jeff Clark' +			
'                        </td>' +			
'                    </tr>' +			
'                    <tr>' +			
'                        <td style="vertical-align: top" width="25%" >' +			
'                            Rep 2:' +			
'                        </td>' +			
'                        <td  width="75%" >' +			
'                        </td>' +			
'                    </tr>' +
'                </table>' +			
'            </td>' +			
'        </tr>' +			
'        </table>' +			
'     </div>';
		return bodystr;
		
    	
    }
}