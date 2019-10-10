/// An API for coffee sales using InterSystems IRIS
/// Dispatch class defined by RESTSpec in cmAPI.spec
Class cmAPI.disp Extends %CSP.REST [ GeneratedBy = cmAPI.spec.cls, ProcedureBlock ]
{

/// The class containing the RESTSpec which generated this class
Parameter SpecificationClass = "cmAPI.spec";

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 1;

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/coffeemakers" Method="post" Call="QueryAll" />
  <Route Url="/newcoffeemaker" Method="post" Call="NewMaker" />
  <Route Url="/coffeemaker" Method="post" Call="QueryMaker" />
  <Route Url="/coffeemaker" Method="put" Call="EditMaker" />
  <Route Url="/coffeemaker" Method="delete" Call="RemoveMaker" />
</Routes>
}

ClassMethod QueryAll() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(cmAPI.impl).QueryAll()
        Do ##class(cmAPI.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("cmAPI.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod NewMaker() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"body")) Quit
        Set pbody=%request.Content
        Set response=##class(cmAPI.impl).NewMaker(pbody)
        Do ##class(cmAPI.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("cmAPI.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod QueryMaker() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If $get(%request.Data("id",1))="" Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"id")) Quit
        If $data(%request.Data("id",2)) {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTDuplicate,"id")) Quit
        }
        Set pid=%request.Data("id",1)
        If ($number(pid,"I")="") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTInvalid,"id",pid)) Quit
        Set response=##class(cmAPI.impl).QueryMaker(pid)
        Do ##class(cmAPI.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("cmAPI.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod EditMaker() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If $get(%request.Data("id",1))="" Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"id")) Quit
        If $data(%request.Data("id",2)) {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTDuplicate,"id")) Quit
        }
        Set pid=%request.Data("id",1)
        If ($number(pid,"I")="") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTInvalid,"id",pid)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"body")) Quit
        Set pbody=%request.Content
        Set response=##class(cmAPI.impl).EditMaker(pid,pbody)
        Do ##class(cmAPI.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("cmAPI.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod RemoveMaker() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If $get(%request.Data("id",1))="" Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"id")) Quit
        If $data(%request.Data("id",2)) {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTDuplicate,"id")) Quit
        }
        Set pid=%request.Data("id",1)
        If ($number(pid,"I")="") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTInvalid,"id",pid)) Quit
        Set response=##class(cmAPI.impl).RemoveMaker(pid)
        Do ##class(cmAPI.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("cmAPI.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

}
