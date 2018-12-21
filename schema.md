# XML Válida – Esquemas

## O que é Esquema XML

- Um esquema XML contém

  - Definição de tipos

  - Declaração de elementos

- Permite

  - Validar elementos e atributos XML e seus valores

  - Estender um esquema existente

- É uma recomendação do W3C

## Componentes Primários

- Definição de Tipos Simples

- Definição de Tipos Complexos

- Declaração de Atributos

- Declaração de Elementos

## Componentes Secundários

- Declaração de Notações

- Definição de Grupos de Atributos

- Definição de Restrições de Identidade

- Definição de Grupos de Modelos

## Componentes Auxiliares

- Anotações

- Grupos de Modelos

- Partículas

- Curingas (wildcards)

- Uso de Atributos

## Estrutura do Arquivo de Esquema

- O arquivo tem a extensão xsd

- Contém um elemento raiz chamado `schema`

- Elemento `schema` pode conter atributos

  - `attributeFormDefault`

  - `elementFormDefault`

  - `id`

  - `targetNamespace`

  - `version`

  - `xmlns` (mais de uma ocorrência)

## Associando Esquema ao Documento XML

- Um documento XML pode ser considerado como uma instância de um esquema

- O elemento raiz do documento XML deve declarar o espaço identificador ao qual ele pertence e isso deve corresponder ao espaço identificador especificado pelo atributo `targetNamespace` no esquema

- O elemento raiz deve declarar o espaço identificador `http://www.w3.org/2000/10/XMLSchema-instance` e atribuir para o atributo `schemaLocation` deste espaço identificador o nome do arquivo contendo o esquema

## Espaço Identificadores (namespaces)

- Evitam ambigüidade e colisão de nomes quando um elemento XML utilizar  esquemas diferentes

- O elemento declara a utilização de um esquema usando o atributo `xmlns` ou a forma `xmlns:`_`prefixo`_

- O _`prefixo`_ é utilizado no nome de todos os elementos declarados no esquema

- O espaço identificador é identificado utilizando um URI (identificador universal de recursos)

- Geralmente, o URI é um URL

## Definição de Tipos Simples

- Pode ser usada na declaração de

  - Atributos

  - Elementos simples contendo apenas texto

- Por Exemplo

  ```xml
  <xs:simpleType name="tipoTemperaturaAgua">
    <xs:restriction base="xs:number">
      <xs:minExclusive value="0.00"/>
      <xs:maxExclusive value="100.00"/>
    </xs:restriction>
  </xs:simpleType>
  ```

## Restringindo Valores Usando Expressões Regular

- Podemos restringir valores utilizando expressões regulares

- Uma expressão regular é especificada utilizando o elemento `xs:pattern` dentro do elemento `xs:restriction`

- Exemplo - `cpf.xml`

  ```xml
  <cpf xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="cpf.xsd">011.077.604-61</cpf>
  ```

## Esquema para validar CPF

- Exemplo - `cpf.xsd`

  ```xsd
  <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xs:element name="cpf">
          <xs:simpleType>
              <xs:union memberTypes="tipoCPF tipoCPFFormatado"/>
          </xs:simpleType>
      </xs:element>
      <xs:simpleType name="tipoCPF">
          <xs:restriction base="xs:string">
              <xs:pattern value="[0-9]{11}"/>
          </xs:restriction>
      </xs:simpleType>
      <xs:simpleType name="tipoCPFFormatado">
          <xs:restriction base="xs:string">
              <xs:pattern value="[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}"/>
          </xs:restriction>
      </xs:simpleType>
  </xs:schema>
  ```

## Definição de Tipos Complexos

- Usada para declarar elementos contendo

  - Atributos

  - Tipo do Conteúdo (elementos filhos)

- Tipos complexos podem estender outros tipos simples ou complexos

- Exemplo

  ```xml
  <xs:complexType name="tipoPedido">
    <xs:sequence>
      <xs:element name="produtoPara" type="tipoEnderecoBrasil"/>
      <xs:element name="notaPara" type="tipoEnderecoBrasil"/>
      <xs:element name="itens" type="tipoItens"/>
    </xs:sequence>
    <xs:attribute name="dataPedido" type="xs:date"/>
  </xs:complexType>
  ```

## Declaração de Atributos

- Uma associação entre um nome e um tipo simples

- Pode conter um valor padrão

- Exemplo

  ```xml
  <xs:attribute name="idade" type="xs:positiveInteger"
    use="required" value="1"/>
  ```

## Declaração de Elementos

- É uma associação entre um nome e tipos simples ou complexos

- Pode estar contida dentro de uma definição de tipo complexo

- Equivalente as declarações ELEMENT e ATTLIST do DTD

- Exemplo

  ```xml
  <xs:element name="autor" type="xs:string"/>
  ```

## Declaração de Notações

- É uma associação entre um nome e um identificador de notação

- Uma notação serve para identificar conteúdo não XML e o programa que processa o conteúdo

- Exemplo

  ```xml
  <xs:notation name="jpeg" public="image/jpeg" system="viewer.exe"/>
  <xs:element name="imagem">
    <xs:complexType mixed="true">
      <xs:attribute name="tipo" type="xs:NOTATION" use="required"/>
    </xs:complexType>
  </xs:element>
  ```

## Definição de Grupos de Atributo

- É usada para reutilizar grupos de atributos em várias definições de tipos complexos

- Exemplo

  ```xml
  <xs:attributeGroup name="grupoNome">
    <xs:attribute name="primeiroNome"/>
    <xs:attribute name="sobreNome"/>
  </xs:attributeGroup>
  <xs:complexType name="tipoAutor">
    <xs:attributeGroup ref="grupoNome"/>
  </xs:complexType>
  ```

## Definição de Restrições de Identidade

- É uma associação entre um nome e qualquer tipo de restrição como chave primária, chave única ou chave estrangeira

- Utiliza a especificação XPATH para indicar os registros aos quais se aplica a restrição

- Exemplo

  ```xml
  <xs:unique name="nomeLivroUnico">
    <xs:selector xpath="livros/livro"/>
    <xs:field xpath="@nome"/>
  </xs:unique>
  ```

## Anotações

- Contém informação sobre o modelo

- Usadas por leitores humanos ou máquinas

- Exemplo

  ```xml
  <xs:annotation>
    <xs:documentation
      source="Temperatura em farenheits"/>
  </xs:annotation>
  ```

## Grupos de Modelos

- Compostos por uma lista de

  - Elementos

  - Curingas

  - Grupos de Modelos

- Temos três tipos de grupos de modelos

  - Seqüência

  - Conjunção

  - Disjunção

## Seqüência

- Todos os elementos deveriam ser especificados e seguem uma seqüência rígida

- Exemplo

  ```xsd
  <xs:sequence>
      <xs:choice>
          <xs:element name="esquerda"/>
          <xs:element name="direita"/>
      </xs:choice>
      <xs:element name="pontoReferencia"/>
  </xs:sequence>
  ```

## Conjunção e Disjunção

- Conjunção

  - Todos os elementos deveriam ser especificados mas não seguem uma seqüência rígida

  - Uma conjunção é criada usando elemento `xs:all`

- Disjunção

  - Qualquer um dos elementos precisa ser especificado
  
  - Uma disjunção é criada usando o elemento `xs:choice`

## Definição de Grupos de Modelos

- É uma associação entre um nome e um grupo de modelo

- Facilita a reutilização do mesmo grupo de modelo em vários tipos complexos

- Exemplo

  ```xml
  <xs:group name="grupoNome">
    <xs:sequence>
      <xs:element name="primeiroNome" type="xs:string"/>
      <xs:element name="sobreNome" type="xs:string"/>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="tipoNome">
    <xs:group ref="grupoNome"/>
  </xs:complexType>
  ```

## Curingas

- O elemento `xs:any` fornece um mecanismo para introduzir um curinga para o conteúdo dos elementos

- O elemento `xs:anyAttribute` é um curinga para qualquer atributo do espaço identificador especificado no atributo `namespace` do elemento

- Exemplo

  ```xml
  <xs:element name="contem_curingas">
    <xs:complexType>
      <xs:sequence>
        <xs:any/>
      </xs:sequence>
      <xs:anyAttribute/>
    </xs:complexType>
  </xs:element>
  ```

## Uso de Atributos

- Usado para especificar se a utilização de qualquer atributo é

  - Requerido

  - Opcional

  - Proibido

- O atributo pode ter um valor fixo (constante)

- Exemplo

  ```xml
  <xs:attribute name="codigo" use="required"
    type="xs:positiveInteger"/>

  <xs:attribute name="segundoNome" use="optional"/>

  <xs:attribute name="copyright" type="xs:string"
    fixed="© Livraria ABC"/>
  ```

## Tipos de Dados Internos

- Tipos primitivos internos fazem parte da especificação de Esquemas XML

|              |         |           |
| ------------ | ------- | --------- |
| string       | boolean | decimal   |
| float        | double  | duration  |
| dateTime     | time    | date      |
| gYearMonth   | gYear   | gMonthDay |
| gDay         | gMonth  | hexBinary |
| base64Binary | anyURI  | QName     |
| NOTATION     |         |           |

## Tipos Derivados Internos

- Tipos derivados a partir de tipos de dados primitivos internos

|                    |       |             |                 |
| ------------------ | ----- | ----------- | --------------- |
| normalizedString   | ID    | IDREF       | IDREFS          |
| nonPositiveInteger | int   | unsignedInt | positiveInteger |
| nonNegativeInteger | long  | short       | negativeInteger |
| unsignedLong       | byte  | integer     | ENTITY          |
| unsignedShort      | Name  | NCName      | ENTITIES        |
| unsignedByte       | token | NMTOKEN     | NMTOKENS        |
| language           |       |             |                 |

## Exemplo Escola - Esquema

- Mesmos dados como no caso da DTD

- Esquema permite maior flexibilidade

  - Definição das chaves

    - Única

    - Primária

    - Estrangeira

  - Definição e extensão de tipos simples e complexos

  - [Link](school-schema.xml)

## Exercício 3

- Crie um esquema XML para a DTD de catálogo de livros criada no Exercício 2

- Estude tópicos avançados

  - Expressões Regular

  - Tipos abstratos

  - Redefinir esquema usando elemento `xs:redefine`

  - Importando esquemas usando elemento `xs:include`

  - Derivando tipos usando elementos `xs:extension` e `xs:restriction`

  - Restringindo derivação de tipos usando atributos `final` e `block` do elemento `xs:complexType`

  - Formas de restringir valores de tipos simples (facets)
