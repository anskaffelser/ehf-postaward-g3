<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:cl="urn:fdc:difi.no:2017:vefa:structure:CodeList-1">

    <xsl:output indent="yes"/>

    <xsl:template match="codeList">
        <cl:CodeList>
            <cl:Title>
                <xsl:choose>
                    <xsl:when test="name[normalize-space()]">
                        <xsl:value-of select="normalize-space(name)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="replace(urn/normalize-space(), '.+:', '')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </cl:Title>
            <cl:Identifier><xsl:value-of select="replace(urn/normalize-space(), '.+:', '')"/></cl:Identifier>
            <cl:Version><xsl:value-of select="version"/></cl:Version>
            <cl:Agency>GS1</cl:Agency>

            <xsl:apply-templates select="code"/>
        </cl:CodeList>
    </xsl:template>

    <xsl:template match="code">
        <cl:Code>
            <cl:Id><xsl:value-of select="value"/></cl:Id>
            <cl:Name>
                <xsl:choose>
                    <xsl:when test="name[normalize-space()]">
                        <xsl:value-of select="normalize-space(name)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="value"/>
                    </xsl:otherwise>
                </xsl:choose>    
            </cl:Name>
            <cl:Description><xsl:value-of select="description/normalize-space()"/></cl:Description>
        </cl:Code>
    </xsl:template>

</xsl:transform>