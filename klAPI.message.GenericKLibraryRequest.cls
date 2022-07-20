Class klAPI.message.GenericKLibraryRequest Extends Ens.Request
{

Property Method As %String;

Property URL As %String;

Property Argument1 As %String;

Property Payload As %String(MAXLEN = 5000);

/// This callback method is invoked by the <METHOD>%Delete</METHOD> method to 
/// provide notification that the object specified by <VAR>oid</VAR> is being deleted.
/// 
/// <P>If this method returns an error then the object will not be deleted.
ClassMethod %OnDelete(oid As %ObjectIdentity) As %Status [ Private, ServerOnly = 1 ]
{
	Set tSC = $$$OK, tThis = ##class(klAPI.message.GenericKLibraryRequest).%Open(oid)
     If $ISOBJECT(tThis.Payload) {
	    Set tSC = ##class(KLlibrary.BObj.Company).%DeleteId(tThis.Payload.%Id())
    	Quit tSC
     }
	Quit $$$OK
}
}