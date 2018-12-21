<!--#include file="sql.asp"-->
<%
    Dim xmlDoc, xslDoc
    Set xmlDoc = CreateObject("MSXML2.DomDocument")
    if xmlDoc.load(Server.MapPath("menu.xml")) = false Then
        Response.Write "Falha na carga do arquivo XML - " & Server.MapPath("menu.xml") & "<br>"
        Response.Write xmlDoc.parseError.reason
        Response.Write " "
        Response.Write "Linha: " & xmlDoc.parseError.line
        Response.Write " "
        Response.Write "Posição: " & xmlDoc.parseError.linePos
        Response.End
    End If
    Set xslDoc = CreateObject("MSXML2.DomDocument")
    if xslDoc.load(Server.MapPath("menu.xsl")) = false Then
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
