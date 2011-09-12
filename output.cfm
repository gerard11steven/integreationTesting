<cfset txt = ListGetAt(CGI.QUERY_STRING,1,"&")/>
<cfoutput>
	<title>Selenium | Oitput</title>
	#Replace(Right(txt, len(txt) - Find('=', txt)), "+", " ", "all")#
</cfoutput>
