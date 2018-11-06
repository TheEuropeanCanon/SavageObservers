<!---
  --- SO
  --- --
  ---
  --- author: chrisb
  --- date:   31/10/18
  --->
<cfcomponent accessors="true" output="false" persistent="false">


	<cfproperty name="DB_SOURCE" getter="true" setter="true" default="spycraft">


	<cffunction name="getTableSchema" access="public" returntype="query">
		<cfargument name="table" type="string" required="true">

		<cfset var local = structnew()>

		<cfquery name="local.schema" datasource="#DB_SOURCE#">

	SELECT TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME,ORDINAL_POSITION,IS_NULLABLE,
DATA_TYPE,CHARACTER_MAXIMUM_LENGTH,COLUMN_TYPE,COLUMN_KEY

FROM information_schema.COLUMNS where TABLE_SCHEMA='spycraft' and table_name ='#arguments.TABLE#';

		</cfquery>

		<cfreturn local.schema>


	</cffunction>



</cfcomponent>