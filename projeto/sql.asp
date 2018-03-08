<%Option Explicit
Function OpenConnection()
    Dim objCon
    Set objCon = CreateObject("ADODB.Connection")
    objCon.Open "File Name=" & Server.MapPath("db.udl") & ";"
    Set OpenConnection = objCon
End Function

Function ConsultarClientes()
    Dim objCon, objRs, strXML
    Set objCon = OpenConnection()
    Set objRs = objCon.Execute("select * from cliente")
    strXML = "<clientes>"
    Do While Not objRs.EOF
        strXML = strXML & "<cliente"
        strXML = strXML & " id=""" & objRs("id") & """"
        strXML = strXML & " nome=""" & objRs("nome") & """"
        strXML = strXML & "/>"
        objRs.MoveNext
    Loop
    strXML = strXML & "</clientes>"
    'Response.Write(Server.HTMLEncode(strXML))
    ConsultarClientes = strXML
End Function

'
' Passe strXML = <cliente id="???" nome="???"/>
'
Function IncluirCliente(strXML)
    Dim xmlDoc, objCon, nodeCliente, strSQL
    Set xmlDoc = CreateObject("MSXML2.DomDocument")
    if xmlDoc.loadXML(strXML) = true Then
        'Response.Write(Server.HTMLEncode(strXML))
        Set objCon = OpenConnection()
        Set nodeCliente = xmlDoc.selectSingleNode("//cliente")
        strSQL = "insert into cliente(nome) values('" & nodeCliente.getAttribute("nome") & "')"
        'Response.Write strSQL
        objCon.Execute strSQL
    End If
End Function

Function ExcluirCliente(id)
    Dim objCon
    Set objCon = OpenConnection()
    objCon.Execute("delete * from cliente where id=" & id)
End Function
%>
<%
'ExcluirCliente(5)
'IncluirCliente("<cliente id=""5"" nome=""Karla""/>")
'ConsultarClientes()
%>
