<cfset txt = ListGetAt(CGI.QUERY_STRING,1,"&")/>
<cfoutput>
	<title>Selenium | Ootput</title>
	#Replace(Right(txt, len(txt) - Find('=', txt)), "+", " ", "all")#
</cfoutput>
