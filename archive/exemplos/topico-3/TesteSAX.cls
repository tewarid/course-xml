VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "TesteSAX"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Implements IVBSAXContentHandler
Const MAX_DEPTH = 100
Dim nDepth As Long, sArray(MAX_DEPTH) As String
Private Sub IVBSAXContentHandler_characters(strChars As String)
'
End Sub
Private Property Set IVBSAXContentHandler_documentLocator( _
  ByVal RHS As MSXML2.IVBSAXLocator)
'
End Property
Private Sub IVBSAXContentHandler_endDocument()
'
End Sub
Private Sub IVBSAXContentHandler_endElement( _
  strNamespaceURI As String, strLocalName As String, _
  strQName As String)
    If strQName = sArray(nDepth - 1) Then 'Found closing tag
        nDepth = nDepth - 1
    End If
End Sub
Private Sub IVBSAXContentHandler_endPrefixMapping(strPrefix As String)
'
End Sub
Private Sub IVBSAXContentHandler_ignorableWhitespace(strChars As String)
'
End Sub
Private Sub IVBSAXContentHandler_processingInstruction( _
  strTarget As String, strData As String)
'
End Sub
Private Sub IVBSAXContentHandler_skippedEntity(strName As String)
'
End Sub
Private Sub IVBSAXContentHandler_startDocument()
'
End Sub
Private Sub IVBSAXContentHandler_startElement( _
  strNamespaceURI As String, strLocalName As String, _
  strQName As String, ByVal oAttributes As MSXML2.IVBSAXAttributes)
    sArray(nDepth) = strQName
    Debug.Print String(nDepth, vbTab) & strQName
    nDepth = nDepth + 1
End Sub
Private Sub IVBSAXContentHandler_startPrefixMapping( _
  strPrefix As String, strURI As String)
'
End Sub
Public Function saxParse(ByVal fileName As String) As Boolean
    Dim oReader As New SAXXMLReader
    Set oReader.contentHandler = Me
    oReader.parseURL fileName
    If nDepth = 0 Then
        saxParse = True
    Else
        saxParse = False
    End If
End Function

