<!--#include file="sql.asp"-->
<%
    Dim xmlDoc, xslDoc
    Set xmlDoc = CreateObject("MSXML2.DomDocument")
    xmlDoc.loadXML(ConsultarClientes())
    Set xslDoc = CreateObject("MSXML2.DomDocument")
    if xslDoc.load(Server.MapPath("cliente01.xsl")) = false Then
        Response.Write "Falha na carga do arquivo XSL - " & Server.MapPath("cliente01.asp") & "<br>"
        Response.Write xslDoc.parseError.reason
        Response.Write " "
        Response.Write "Linha: " & xslDoc.parseError.line
        Response.Write " "
        Response.Write "Posição: " & xslDoc.parseError.linePos
        Response.End
    End If
    Response.Write xmlDoc.transformNode(xslDoc)
%>
