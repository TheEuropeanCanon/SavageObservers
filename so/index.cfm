<!--- SO web client circuit controller page --->

<link rel="stylesheet" type="text/css" href="savage.css">


<cfparam name="URL.CIRCUIT" default="">

<cfswitch expression="#URL.CIRCUIT#">

	<cfdefaultcase>
		<cfinclude template="dsp_home.cfm">
	</cfdefaultcase>

	<cfcase value="form">
		<cfinclude template="dsp_form.cfm">
	</cfcase>

	<cfcase value="admin">
		<cfinclude template="dsp_admin.cfm">
	</cfcase>

</cfswitch>