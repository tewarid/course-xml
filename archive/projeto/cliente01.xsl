<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="clientes">
        <TABLE border="1">
            <TR>
                <TH>Código</TH>
                <TH>Nome</TH>
                <TH>Excluir</TH>
            </TR>
        <xsl:for-each select="cliente">
            <TR>
                <TD><xsl:value-of select="@id"/></TD>
                <TD><xsl:value-of select="@nome"/></TD>
                <TD align="center"><xsl:element name="A">
                        <xsl:attribute name="href">cliente02.asp?id=<xsl:value-of select="@id"/>
                        </xsl:attribute>X
                    </xsl:element>
                </TD>
            </TR>
        </xsl:for-each>
        </TABLE>
        <A href="cliente03.asp">Inserir</A>
    </xsl:template>
</xsl:stylesheet>
