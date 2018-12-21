<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
    <xsl:template match="/">
        <html>
	    <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="catalogo">
        <table width="100%" border="1">
            <tr>
                <td><p>Livros</p></td>
            </tr>
            <xsl:for-each select = "livros/livro">
            <tr>
                <td>
                    <p><xsl:value-of select="@nome"/></p>
                 </td>
            </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
