/// Class for coffeemaker objects, extends JSON to be compatible with REST calls
Class cmAPI.coffeemaker Extends (%Persistent, %JSON.Adaptor)
{

Property ProductName As %String;

Property ProductBrand As %String;

Property ProductColor As %String;

Property ProductPrice As %Numeric(SCALE = 2);

Property NumberOfCups As %Integer(VALUELIST = ",1,2,3,4,8,12,16,32,64");

Property ImageFileName As %String(MAXLEN = 256) [ InitialExpression = "test-redphone.png" ];

}