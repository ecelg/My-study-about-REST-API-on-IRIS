Class KLlibrary.BObj.Company Extends (%Persistent, %JSON.Adaptor)
{

Property Name As %String [ Required ];

Index NameIndex On Name;

Property WebURL As %String(MAXLEN = 300);

Property Description As %String(MAXLEN = 2000);

Property Remark As %String;

Property EstablishYear As %Integer;

}