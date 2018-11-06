

<cfdump var="#URL#">

<cfinvoke component="SO" method="getTableSchema" returnvariable="QrySchema">
	<cfinvokeargument name="table" value="#URL.TABLE#">
</cfinvoke>

<cfdump var="#QrySchema#">