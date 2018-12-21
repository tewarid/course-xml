
# Acesso Programático - DOM

## DOM – Document Object Model

- Representa todo conteúdo do documento XML como uma árvore

- Cada elemento, texto de um elemento, atributo, comentário, instrução de processamento etc é representado como um nó nesta árvore

- É uma especificação recomendada pelo W3C

## Objetos do DOM

- O Node representa um nó na árvore do DOM

- NodeList e NamedNodeMap são utilizados para agregar nós

- O DOM é composto de vários tipos de objetos que herdam de Node

|                 |              |                       |              |
| --------------- | ------------ | --------------------- | ------------ |
| Element         | Attr         | Text                  | CDATAsection |
| EntityReference | Entity       | ProcessingInstruction | Comment      |
| Document        | DocumentType | DocumentFragment      | Notation     |

## Objeto Node

- O objeto Node disponibiliza várias propriedades para navegar a árvore do DOM

  - nodeType: Tipo do objeto representado pelo nó

  - parentNode: Objeto pai do nó atual

  - childNodes: Lista de nós filhos do nó atual

  - firstChild: Primeiro nó filho

  - lastChild: Último nó filho

  - previousSibling: Nó anterior no mesmo nível que o atual (último irmão)

  - nextSibling: Nó posterior no mesmo nível que o atual (próximo irmão)

  - attributes: Lista de atributos caso o nó atual tiver atributos

  - nodeName: Nome do nó

  - nodeValue: Valor texto do nó

## Métodos do Objeto Node

- Disponibilizados pelo objeto Node para inserir, duplicar, remover e substituir outros objeto Node

  - appendChild: Adiciona um novo nó filho.

  - cloneNode: Cria cópia de um nó.

  - hasAttributes: Retorna verdadeiro se o nó tiver atributos.

  - hasChildNodes: Retorna verdadeiro se o nó tiver filhos

  - insertBefore: Insere um nó filho antes do nó filho especificado

  - isSupported: Retorna verdadeiro se tiver suporte para um recurso do DOM

  - normalize: Normaliza a estrutura do nó

  - removeChild: Remove um nó filho
  
  - replaceChild: Substitui um nó filho

## Objetos NodeList e NamedNodeMap

- Objeto NodeList

  - Fornece uma lista de nós

  - É uma coleção indexada de nós começando com o índice 0

- Objeto NamedNodeMap

  - Fornece uma coleção de nós

  - Os nós podem ser acessados usando nomes

  - Os nós também podem ser acessados usando um índice numérico

## Objeto Attr

- Representa atributos

- Objeto Attr herda do objeto Node mas não faz parte da árvore de documento

  - Por isso atributos parentNode, previousSibling e nextSibling do objeto Node tem valor nulo

- Em MSXML 3.0 a interface é chamada de IXMLDOMAttribute

## Objeto Element

- Representa um elemento XML

- Herda do objeto Node

  - Tem todas as características e operações do objeto Node

- Contém métodos para recuperar objetos do tipo Attr pelo nome ou pelo índice

- Propriedades

  - tagName: Nome do elemento

## Objetos CharacterData e Text

- Objeto CharacterData

  - Representa dados caractere usando Unicode (UTF-16)

  - Estende o objeto Node

- Objeto Text

  - Representa dados texto dentro de um elemento.

  - Herda do Objeto CharacterData

## Objeto Document

- Representa um documento XML

- Herda do objeto Node

- Acrescenta algumas propriedades a mais

  - documentElement: Elemento raiz

  - doctype: Tipo do documento

- Acrescenta alguns métodos

- Métodos específicos do parser MSXML 3.0

  - loadXML: Carregar texto XML

  - load: Carregar arquivo XML

## Usando DOM para criar Documentos XML

- Usaremos MSXML nos exemplos

- O exemplo a seguir

  - Utiliza o objeto DOMDocument para criar um novo documento XML

  - Insere uma nova instrução de processamento

  - Cria nó do tipo `NODE_ELEMENT` e do tipo `NODE_ATTRIBUTE`

  - Gera a saída

    ```xml
    <?xml version="1.0"?>
    <catalogo data="12/01/2001"><livro nome="Programando em Java"/></catalogo>
    ```

## Exemplo usando MSXML Parser versão 3.0

```vb
Dim oDom As New MSXML2.DOMDocument
Dim oElemento As MSXML2.IXMLDOMNode
Dim oAtributo As MSXML2.IXMLDOMNode
oDom.appendChild oDom.createProcessingInstruction( _
  "xml", "version=""1.0""")
Set oElemento = oDom.appendChild( _
  oDom.createNode(NODE_ELEMENT, "catalogo", ""))
Set oAtributo = oElemento.Attributes.setNamedItem( _
  oDom.createNode(NODE_ATTRIBUTE, "data", ""))
oAtributo.Text = "12/01/2001"
Set oElemento = oElemento.appendChild( _
  oDom.createElement("livro"))
Set oAtributo = oElemento.Attributes.setNamedItem( _
  oDom.createAttribute("nome"))
oAtributo.Text = "Programando em Java"
```

## Usando DOM para ler Documentos XML

- Usaremos MSXML neste exemplo

- O objeto DOMDocument é usado para ler XML

  - O método load carrega um arquivo XML

- No exemplo ilustramos

  - Como tratar erros usando atributo parseError

  - Como ler todos os nós de um documento XML usando um método recursivo

## Ler documento DOM usando método recursivo

```vb
oDom.Load "nome do arquivo XML"
If oDom.parseError.errorCode = 0 Then
  Debug.Print parse(oDom.documentElement, 0)
End If

Function parse(oNode As IXMLDOMNode, Nivel As Long) As String
  Dim i As Long
  Dim s As String
  s = s & String(Nivel, vbTab) & oNode.nodeName & vbCrLf
  For i = 0 To oNode.Attributes.length - 1
    s = s & String(Nivel + 1, vbTab) _
          & oNode.Attributes(i).nodeName _
          & "=" & oNode.Attributes(i).nodeValue & vbCrLf
  Next
  For i = 0 To oNode.childNodes.length - 1
    s = s & parse(oNode.childNodes.Item(i), Nivel + 1)
  Next
  parse = s
End Function
```

## Resultado da Leitura

- Aqui mostramos a saída gerada pela leitura do documento XML

- O documento XML utilizado foi:

  ```xml
  <catalogo>
  <livro nome="Programação Java">
    <autor nome="Paulo Junior"/>
  </livro>
  </catalogo>
  ```

- Resultado

  ```text
  catalogo
      livro
          nome=Programação Java
          autor
              nome=Paulo Junior
  ```

## Exercício 4

- Use o DOM para ler o catálogo de livros criado anteriormente e mostrar nome de todos os livros dentro de um controle como ListBox
