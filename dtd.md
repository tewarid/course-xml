# XML Válida – DTD

## Porque Utilizar DTD

- DTD significa Definição do Tipo de Documento

- XML bem formada não basta

  - Precisa haver uma forma de definir o vocabulário do documento XML com precisão

  - Parsers XML podem usar a DTD para validação de uma instância do documento XML

  - Editores de XML (como XMLSpy) podem usar a DTD para fazer valer as regras contidas nele na hora de editar um documento XML

## Associando DTD com Documento XML

- Usando a instrução de processamento `DOCTYPE`

- Duas formas

  - DTD Interna

    - DTD fica dentro do documento XML

  - DTD Externa

    - DTD fica num arquivo separado

    - Facilmente aplicada a vários documentos XML

## Componentes de DTD

- Sintaxe da DTD não utiliza XML

- Uma DTD contém os componentes a seguir

  - ELEMENT

  - ATTLIST

  - ENTITY

  - NOTATION

## Declaração ELEMENT

- Declarar um novo tipo de elemento XML

  - `<!ELEMENT` seguido pelo nome do elemento

  - Nome tem que ser identificador XML válido

  - Nome seguido pela definição de conteúdo

- Exemplos

  ```xml
  <!ELEMENT livro (#PCDATA)>

  <!ELEMENT autor (titulo, nome)>

  <!ELEMENT autor ANY>
  ```

## Declaração ELEMENT – Modelo de Conteúdo

- Para especificar conteúdo dentro de um elemento

- Contém uma combinação de

  - Texto – indicado usando `#PCDATA`

  - Elementos filhos

  - Operadores

- Exemplos

  ```xml
  <!ELEMENT livro (#PCDATA | autor)*>

  <!ELEMENT livro (autor+, custo?)>

  <!ELEMENT livro (custo, (autor | editora)+)>
  ```

## Declaração ATTLIST

- Atributos são propriedades de um elemento

- Declarados usando a sintaxe

  ```xml
  <!ATTLIST elemento atributo tipo uso>
  ```

- Exemplo

  ```xml
  <!ATTLIST autor
    primeiro CDATA #REQUIRED
    ultimo CDATA #REQUIRED
    conveniado CDATA #FIXED "sim"
  >
  ```

## Atributos do tipo ID, IDREF e IDREFS

- ID é usado para definir um nome único no documento

  - Uso de um ID é sempre `#REQUIRED`

- IDREF refere-se a um ID declarado no documento

  - Usado para criar relacionamentos um para um

- IDREFS refere-se a vários ID ao mesmo tempo

  - Usado para criar relacionamentos um para vários

- Exemplos

  ```xml
  <!ATTLIST livro nome ID #REQUIRED>

  <!ATTLIST livro tipo IDREF #REQUIRED>
  ```

## Atributos do tipo ENTITY e ENTITIES

- Apontam para Entidades definidas no mesmo documento usando declaração ENTITY

- ENTITIES é uma lista de ENTITY separadas por espaços

- Exemplo

  ```xml
  <!ENTITY textoCopyright "(c) Livraria Cataloga">
  <!ATTLIST livro
    copyright ENTITY #IMPLIED
  >
  ```

  O documento XML vai conter

  ```xml
  <livro copyright="textoCopyright">
  ```

## Atributos tipo NMTOKEN e NMTOKENS

- NMTOKEN são fichas nomeadas

- O processamento e checagem de validade das fichas fica por conta da aplicação

- Exemplo

  ```xml
  <!ELEMENT livro EMPTY>
  <!ATTLIST livro
    nome CDATA #REQUIRED
    tipo IDREF #REQUIRED
    autores IDREFS #REQUIRED
    copyright ENTITY #IMPLIED
    editora NMTOKEN #REQUIRED
  >
  ```

## Atributo tipo NOTATION

- O atributo desse tipo é usado em conjunto com a declaração NOTATION (notação)

- Uma notação declara um formato e o aplicativo externo que deve processá lo

- Exemplo

  ```xml
  <!NOTATION jpg SYSTEM "jpgviewer.exe">
  <!NOTATION gif SYSTEM "gifviewer.exe">
  <!ELEMENT livro (imagem)>
  <!ELEMENT imagem (#PCDATA)>
  <!ATTLIST imagem
    tipo NOTATION (gif | jpg) "gif"
  >
  ```

## DTD Interna

- Elementos declarados na DTD interna sobrepõem elementos da DTD externa

- Uso menos frequente porque

  - Ocupa espaço em cada documento

  - Difícil alterar por estar em vários documentos XML

## Exemplo Escola

- Criar DTD para representar dados de uma escola

- Coisas

  - Escola

  - Estudante

  - Professor

  - Aula

- [Link](school-dtd.xml)

## Limitação de DTD

- Difícil de escrever e entender

- Difícil processar programaticamente

- Difícil de estender

- Sem suporte para espaços identificadores (namespace)

- Nenhum suporte para tipos de dados

- Nenhum suporte para herança

## Exercício 2

- Crie uma DTD para o documento XML de catálogo de livros criado no Exercício 1
