<!--#include file="sql.asp"-->
<%
    Dim intID
    intID = request.item("id")
    ExcluirCliente intID
    response.redirect "cliente01.asp"
%>
