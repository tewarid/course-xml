<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output encoding="UTF-8" method="html"/>
	<xsl:template match="menu">
		<xsl:for-each select="link | titulo">
			<xsl:choose>
				<xsl:when test="name()='link'">
					<xsl:call-template name="link"/>
				</xsl:when>
				<xsl:when test="name()='titulo'">
					<xsl:call-template name="titulo"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="link">
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
			<xsl:value-of select="@nome"/>
		</xsl:element>
		<br/>
	</xsl:template>
	<xsl:template name="titulo">
		<xsl:value-of select="@nome"/><br/>
		<xsl:for-each select="link">
			<xsl:call-template name="link"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
