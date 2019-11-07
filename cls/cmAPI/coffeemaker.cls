///Class for coffeemaker objects, each with a unique CoffeemakerID

Class cmAPI.coffeemaker Extends (%Persistent, %Populate, %XML.Adaptor, %JSON.Adaptor)
{

Property CoffeemakerID As %Integer [ Calculated, SqlComputeCode = {Set {*} = {ID} }, SqlComputed ];

Property Name As %String;

Property Brand As %String;

Property Color As %String;

Property NumCups As %Integer(VALUELIST = ",1,2,3,4,8,12,16,32,64");

Property Price As %Numeric(SCALE = 2);

Property Img As %String(MAXLEN = 256) [ InitialExpression = "test-redphone.png" ];

}
