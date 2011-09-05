<cfset txt = ListGetAt(CGI.QUERY_STRING,1,"&")/>
<!--- <cfset txt = Mid(txt,6)> --->
<cfoutput>
	#Replace(Right(txt, len(txt) - Find('=', txt)), "+", " ")#
</cfoutput>