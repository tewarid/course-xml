
# Acesso Programático - SAX

## Simple API for XML

- Está baseada em eventos

- É um padrão _de fato_, não é um padrão do W3C

- A versão preliminar chamado de SAX

- A versão atual é chamado SAX2

  - Oficialmente disponível para Java

  - Tem suporte para espaços identificadores

## Lendo um Documento XML Usando SAX

- Utilizamos parser SAX do pacote MSXML 3.0

- Implementamos a interface `ContentHandler` para receber e tratar callbacks (eventos) SAX

- Usamos os eventos

  - startElement

  - endElement

- Para executar o exemplo podemos chamar o método `saxParse` passando como parâmetro o nome do arquivo XML

## Lendo um Documento XML Usando SAX em VB

```vb
Implements IVBSAXContentHandler
Const MAX_DEPTH = 100
Dim nDepth As Long, sArray(MAX_DEPTH) As String
Private Sub IVBSAXContentHandler_endElement( _
  strNamespaceURI As String, strLocalName As String, _
  strQName As String)
    If strQName = sArray(nDepth - 1) Then 'Found closing tag
        nDepth = nDepth - 1
    End If
End Sub
Private Sub IVBSAXContentHandler_startElement( _
  strNamespaceURI As String, strLocalName As String, _
  strQName As String, ByVal oAttributes As MSXML2.IVBSAXAttributes)
    sArray(nDepth) = strQName
    Debug.Print String(nDepth, vbTab) & strQName
    nDepth = nDepth + 1
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
```

## Lendo um Documento XML Usando SAX - Resultado

```text
catalogo
    autores
        autor
            primeiroNome
            sobreNome
    ...
    livros
        livro
            autor
                primeiroNome
                sobreNome
```

## XML e Java

- O mundo Java tem diversos APIs e parsers XML

- APIs

  - JAXP da SUN

  - JDOM

- Parsers DOM

  - XML4J da IBM

  - Xerces do Apache

- Parsers SAX

  - Xerces do Apache

## Usando JAXP - DOM

- JAXP gera uma árvore DOM usando um parser SAX

- Pacotes JAXP utilizados no exemplo

  - javax.xml.parsers

    - Classes DocumentBuilder, DocumentBuilderFactory e ParserConfigurationException

  - org.w3c.dom

    - Classes Document, Node, NamedNodeMap e NodeList

  - org.xml.sax

    - Classe SAXException

## Usando JAXP DOM - Exemplo Java

```java
import java.io.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;
class LeitorDOM {
  public static void main(String args[]) throws ParserConfigurationException, IOException, SAXException {
    DocumentBuilder leitor = DocumentBuilderFactory.newInstance().newDocumentBuilder();
    Document documento = leitor.parse("catalogo.xml");
    processNode(documento);
  }
  private static void processNode(Node no) {
      System.out.println(no.getNodeName());
      if (no.hasAttributes()) {
          NamedNodeMap attr = no.getAttributes();
          for (int i=0; i < attr.getLength(); i++) {
              System.out.println(attr.item(i).getNodeName());
          }
      }
      if (no.hasChildNodes()) {
          NodeList nos = no.getChildNodes();
          for (int i=0; i < nos.getLength(); i++) {
              processNode(nos.item(i));
          }
      }
  }
}
```

## Usando JAXP – SAX

- JAXP vem com um parser SAX

  - Isso não impede a utilização de outro parser SAX qualquer

- Pacotes JAXP utilizados no exemplo:

  - javax.xml.parsers

    - Classes SAXParser, SAXParserFactory e ParserConfigurationException

  - org.xml.sax

    - Classe SAXException

  - org.xml.sax.helpers

    - Classe DefaultHandler

## Usando JAXP SAX - Exemplo Java

```java
import java.io.*;
import javax.xml.parsers.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
class LeitorSAX extends DefaultHandler {
  public static void main(String args[]) throws SAXException, ParserConfigurationException, IOException {
    SAXParser leitor = SAXParserFactory.newInstance().newSAXParser();
    leitor.parse("catalogo.xml", new LeitorSAX());
  }
  public void startElement(String namespaceURI, String lName, String qName, Attributes attrs) throws SAXException {
      System.out.println(qName);
  }
}
```

- Empty methods have been pruned

## Exercício 5

- Utilize SAX para ler o catálogo de livros criado anteriormente e mostrar o nome de todos os livros dentro de um controle como ListBox

## JDOM

- Limitações do DOM

  - Independente da Linguagem
  
    - Não foi desenhado com a linguagem Java em mente

    - Não faz uso das classes de coleção existentes

  - Herança de classes estrita

    - Demais objetos são derivados do objeto Node

  - Baseado em Interface

- Vantagens da [JDOM](http://www.jdom.org)

  - Para Java

  - Hierarquias de classes inexistentes

## Método Pull em Microsoft .NET

- A API SAX utiliza callbacks para avisar quando elementos são encontrados

- O método Pull utiliza chamadas explícitas a um método que recupera um elemento após outro

- Implementada pela classe XmlTextReader do espaço identificador System.Xml

- O exemplo utiliza a linguagem C## da plataforma .NET

## Método Pull para ler documento XML em C\#

```c#
using System;
using System.Xml;

public class TestXMLReader {
  public static void Main() {
    XmlTextReader reader = new XmlTextReader("teste.xml");
    while (reader.Read()) {
      if (reader.NodeType == XmlNodeType.Element) {
        Console.WriteLine("Found Element: " + reader.Name);
        if (reader.HasAttributes) {
          while (reader.MoveToNextAttribute())  {
            Console.WriteLine("Found Attribute: " + reader.Name);
          }
        }
      }
    }
    reader.Close();
  }
}
```
