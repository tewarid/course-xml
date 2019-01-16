# Sintaxe da XML – XML Bem Formada

## O que é XML?

- XML - `eXtensible` Markup Language

- Baseada em marcadores (tags) como HTML

- Por Exemplo

  ```xml
  <livros>
    <livro nome="Aprenda Java"></livro>
    <livro nome="Aprenda XML"></livro>
  </livros>
  ```

## Porque XML?

- XML é uma HTML melhorada?

- Nenhum marcador predefinido

  - Extensível

- Sintaxe mais rígida

  - Fácil validar

## Quem controla XML?

- É um padrão aberto

- Padronizada pelo World Wide Web Consortium (W3C)

- Evoluiu da SGML (padrão da ISO - ISO8879)

- Recomendação do W3C desde Fevereiro de 1998

## Uso de XML

- Armazenagem de Documentos

- Intercâmbio de Dados

  - Entre base de dados e aplicação

  - Entre aplicações

- Armazenagem de Dados

  - Base de dados

  - Arquivos de configuração

## Outros Padrões Relacionados a XML

- Espaços identificadores (namespaces)

- XPATH

- Folhas de Estilo (style-sheets)

  - CSS

  - XSL

- DOM e SAX

- XLink e XPointer

## Trabalhando com XML

- Browser XML

- Editor XML

- Parser XML

- Processador de XSL

## Estrutura de um Documento XML

- A declaração `xml`

- Elementos

- Atributos

- Comentários

## Entidades XML

- Usadas para criar dados predefinidos

- A ocorrência de uma entidade no documento XML é substituída pelo seu valor pelo parser

- A ocorrência começa com `&` e termina com `;`

- A XML utiliza entidades para representar alguns caracteres reservados pela linguagem, como `>` (`&gt;`) e `<` (`&lt;`)

- Novas entidades podem ser criadas usando uma DTD

## Atributos Especiais

### `xml:space`

- Preservar ou não espaços em branco duplicados

### `xml:lang`

- Linguagem natural do valor texto de um elemento

## Instruções de Processamento

- Podem ser usadas para associar arquivos CSS e XSL

- Iniciam com `<?` e terminam com `?>`

- Depois de `<?` aparece a aplicação destinatária

- Depois da aplicação aparece o texto da instrução

- Exemplo

  ```xml
  <?xml-stylesheet href="teste.xsl" type="text/xsl"?>
  ```

## Seção CDATA

- CDATA significa dados caractere

- É usada para colocar texto qualquer como scripts de código, como VBScript ou JScript, dentro da XML

- É delimitada pelo `<![CDATA[` e `]]>`

- Uma seção CDATA não pode ser aninhada dentro da outra

## XML Bem Formada

### Condições

- Apenas um elemento raiz

- Elementos sem sobreposição

- Início e fim de elementos corretamente demarcado

- Nome de elementos e atributos corretamente formado

- Valor do atributo demarcado com aspas duplas

- Texto caractere sem caracteres reservados ou inválidos

## Projetando Documentos XML

- Identificar nomes para coisas e conceitos

- Identificar hierarquia das coisas

  - Identificar os relacionamentos entre coisas

- Definir propriedades das coisas

- Isso é modelagem orientado objeto

  - Documentos XML podem ser gerados exportando uma hierarquia de objetos

## Quando usar Atributos para Propriedades

- Vantagens

  - Possível restringir valor usando DTD

  - Validação de ID e IDREF

  - Requer menos espaço

  - Fácil processar usando DOM e SAX

- Desvantagens

  - Valores simples

  - Não suporta atributos sobre atributos

## Quando usar Elementos Filhos para Propriedades

- Vantagens

  - Suporta valores complexos

  - Suporta atributos sobre atributos

  - Extensível quando modelo de dados muda (um livro vários autores)

- Desvantagens

  - Requer mais espaço

  - Mais difícil processar

## Exercício 1

- Como utilizar XMLSpy

- Crie um catálogo de livros usando XML

  - Sugira um modelo para o documento

  - Crie o documento usando o modelo
