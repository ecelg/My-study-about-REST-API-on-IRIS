/// An API for query Kates library in InterSystems IRIS<br/>
/// Business logic class defined by OpenAPI in klAPI.spec<br/>
/// Updated Jul 7, 2022 23:53:19
Class klAPI.impl Extends (%REST.Impl, Ens.Rule.FunctionSet) [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Returns all companies
ClassMethod QueryAllCompany() As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
    
    try{
    	set tArr=[]
    	
    	//query KLlibrary_BObj.Company for all company
    	//Select * from KLlibrary_BObj.Company
    	set rs=##class(%SQL.Statement).%ExecDirect(,"Select * from KLlibrary_BObj.Company")
   	 
    	//compose JSON from the quired info
    	while rs.%Next()
    	{
	    	do tArr.%Push({
		    	"Name":(rs.%Get("Name")),
		    	"WebURL":(rs.%Get("WebURL")),
		    	"Description":(rs.%Get("Description")),
		    	"Remark":(rs.%Get("Remark")),
		    	"EstablishYear":(rs.%Get("EstablishYear"))
	    	})
    	}
    	return tArr.%ToJSON()
    }
    catch(ex)
    {
	    do ..%SetStatusCode("500")
	    return {"ErrorMessage": "Server Error"}
    }
}

/// Add a new compnay to the library. Company Name and WebURL must be provided in the request body. Returns new company<br/>
/// The method arguments hold values for:<br/>
///     body<br/>
///     prod<br/>
ClassMethod NewCompany(body As %Stream.Object, prod As %Boolean = "") As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
    if prod'=1
    {
	    try
	    {
		    //create a new Company object
		    set company=##class(KLlibrary.BObj.Company).%New()
		    
		    //fill new Compnay with data from message body
		    do company.%JSONImport(body)
		    do company.%Save()
		    do company.%JSONExportToString(.companyOut)
		    return companyOut
	    }
	    catch(ex)
	    {
		    do ..%SetStatusCode("500")
	    	return {"ErrorMessage": "Server Error"}
	    }
    }
}

/// Get the company from the list by given ID and data. Returns company<br/>
/// The method arguments hold values for:<br/>
///     id, CompanyId<br/>
///     prod<br/>
ClassMethod QueryCompanyById(id As %Integer, prod As %Boolean = "") As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
    if prod'=1
    {
	    try
	    {
		    //check if the ID exisit
		    if '##class(KLlibrary.BObj.Company).%ExistsId(id)
		    {
			    do ..%SetStatusCode("400")
	    		return {"ErrorMessage": "No company with this ID"}
		    }
		    
		    //open the company object with the given ID
		    set company=##class(KLlibrary.BObj.Company).%OpenId(id)
		    //fill export the compnay data to JSON format
		    do company.%JSONExportToString(.companyOut)
		    return companyOut
	    }
	    catch(ex)
	    {
		    do ..%SetStatusCode("500")
	    	return {"ErrorMessage": "Server Error"}
	    }
    }
    if prod=1
    {
	    //complete the request through the business process
	    try
	    {
		    return ..CallInterface("/company","GET",id,"")
	    }
	    catch(ex)
	    {
		    do ..%SetStatusCode("500")
			return {"ErrorMessage": "Failed business process call"}
	    }
    }
}

/// Update existing company given ID and data. Returns updated company<br/>
/// The method arguments hold values for:<br/>
///     id, CompanyId<br/>
///     body, Company Info<br/>
///     prod<br/>
ClassMethod EditCompanyById(id As %Integer, body As %Stream.Object, prod As %Boolean = "") As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
    if prod'=1
    {
	    try
	    {
		    //check if the ID exisit
		    if '##class(KLlibrary.BObj.Company).%ExistsId(id)
		    {
			    do ..%SetStatusCode("400")
	    		return {"ErrorMessage": "No company with this ID"}
		    }
		    
		    //open the company object with the given ID
		    set company=##class(KLlibrary.BObj.Company).%OpenId(id)
		    //fill new Compnay with data from message body
		    do company.%JSONImport(body)
		    do company.%Save()
		    //fill export the compnay data to JSON format
		    do company.%JSONExportToString(.companyOut)
		    return companyOut
	    }
	    catch(ex)
	    {
		    do ..%SetStatusCode("500")
	    	return {"ErrorMessage": "Server Error"}
	    }
    }
    if prod=1
    {
	    //complete the request through the business process
	    try
	    {
		    return ..CallInterface("/company","POST",id,body)
	    }
	    catch(ex)
	    {
		    do ..%SetStatusCode("500")
			return {"ErrorMessage": "Failed business process call"}
	    }
    }
}

/// Delete existing company given ID. Returns deleted company<br/>
/// The method arguments hold values for:<br/>
///     id, CompanyId<br/>
///     prod<br/>
ClassMethod RemoveCompanyById(id As %Integer, prod As %Boolean = "") As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
    if prod'=1
    {
	    try
	    {
		    //check if the ID exisit
		    if '##class(KLlibrary.BObj.Company).%ExistsId(id)
		    {
			    do ..%SetStatusCode("400")
	    		return {"ErrorMessage": "No company with this ID"}
		    }
		    
		    //delete the company object with the given ID
		    //set company=##class(KLlibrary.BObj.Company).%DeleteId(id)
	    	//return id
	    	return {"kate comment": "I won't let you delect any thing from my list!!!!!!!"} 
	    }
	    catch(ex)
	    {
		    do ..%SetStatusCode("500")
	    	return {"ErrorMessage": "Server Error"}
	    }
    }
}

// Helper method to send a message to the interface

ClassMethod CallInterface(URL As %String, Method As %String, Argument1 As %String = "", Payload As %DynamicObject = "") As %DynamicObject
{
	s service=$$$OK
	//create business service instance
	set service = ##class(Ens.Director).CreateBusinessService("KLlibraryProd.bs.RESTKLibraryService",.tService)
	if ($$$ISERR(service)) w service_":service error"
	//create and fill out request
	set request = ##class(klAPI.message.GenericKLibraryRequest).%New()
	set request.URL = URL
	set request.Method = Method
	set request.Argument1 = Argument1
	
	set formatter = ##class(%JSON.Formatter).%New()
	do formatter.FormatToString(Payload, .tmpPayload)
	set request.Payload = tmpPayload
	
	//send request and process input
 	do tService.ProcessInput(request, .output)
 	
 	do ..%SetHeader("Content-Type","application/json")
 
  	//turn output into response
 	#Dim output As klAPI.message.GenericKLibraryResponse
 	
	return output.JSONResponse
}

}
