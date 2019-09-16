Class demo.HelperMethods
{

/// Helper method
ClassMethod ValidateJSON(obj As %DynamicObject, Output error As %DynamicObject) As %Boolean
{
	Set error = {}
	
	If obj.%Get("name") = "" {
		Set error.errormessage = "Name was blank"
		Quit 0
	}	
	
	If obj.%Get("brand") = "" {
		Set error.errormessage = "Brand was blank"
		Quit 0
	}
	
	Quit 1
}

/// Helper method
ClassMethod CopyToCoffeemakerFromJSON(ByRef cm As demo.coffeemaker, obj As %DynamicObject)
{
	Set cm.Name=obj.name
	set cm.Brand = obj.brand
	Set cm.Img = obj.img
	set cm.Color = obj.color
	set cm.NumCups = obj.numcups
	set cm.Price = obj.price
}

/// Helper method
ClassMethod GetJSONFromRequest(Output obj As %DynamicObject) As %Boolean
{
	Set ok = 1
	Try {
		Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
	} Catch ex {
		Set ok = 0
	}
	Quit ok
}

}
