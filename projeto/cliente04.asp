<!--#include file="sql.asp"-->
<%
    Dim strNome, strXML
    strNome = Request.item("nome")
    If trim(strNome) = "" Then
        response.redirect "cliente01.asp" 
    End If
  
    strXML = "<cliente id="""" nome=""" & strNome & """/>"
    'Response.Write strXML
    IncluirCliente strXML
    Response.Redirect "cliente01.asp"
%>
