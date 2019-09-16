Class demo.coffeemaker Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property CoffeemakerID As %Integer [ Calculated, SqlComputeCode = {Set {*} = {ID} 
}, SqlComputed ];

Property Name As %String;

Property Brand As %String;

Property Color As %String;

Property NumCups As %Integer(VALUELIST = ",1,2,3,4,8,12,16,32,64");

Property Price As %Numeric(SCALE = 2);

Property Img As %String(MAXLEN = 256) [ InitialExpression = "test-redphone.png" ];

Method ToJSON() As %String
{
	set obj = {}
	set obj.CoffeemakerID = ..CoffeemakerID
	set obj.Name = ..Name
	set obj.Brand = ..Brand
	set obj.Color = ..Color
	set obj.NumCups = ..NumCups
	set obj.Price = ..Price
	set obj.Img = ..Img
	set string = obj.%ToJSON()
	quit string
}

Storage Default
{
<Data name="coffeemakerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Brand</Value>
</Value>
<Value name="4">
<Value>Color</Value>
</Value>
<Value name="5">
<Value>NumCups</Value>
</Value>
<Value name="6">
<Value>Price</Value>
</Value>
<Value name="7">
<Value>Img</Value>
</Value>
</Data>
<DataLocation>^demo.coffeemakerD</DataLocation>
<DefaultData>coffeemakerDefaultData</DefaultData>
<IdLocation>^demo.coffeemakerD</IdLocation>
<IndexLocation>^demo.coffeemakerI</IndexLocation>
<StreamLocation>^demo.coffeemakerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}