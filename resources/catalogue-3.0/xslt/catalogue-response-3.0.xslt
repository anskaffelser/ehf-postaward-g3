<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="urn:oasis:names:specification:ubl:schema:xsd:Order-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:TendererQualification-2"
                exclude-result-prefixes="xs ubl">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="ID"/>
    <xsl:param name="Note"/>
    <xsl:param name="ResponseCode"/>
    <xsl:param name="VersionID"/>

    <xsl:template match="/ubl:*">
        <ApplicationResponse>
            <cbc:CustomizationID>urn:fdc:peppol.eu:poacc:trns:catalogue_response:3</cbc:CustomizationID>
            <cbc:ProfileID>urn:fdc:peppol.eu:poacc:bis:catalogue_only:3</cbc:ProfileID>

            <xsl:choose>
                <xsl:when test = "$ID != '' " >
                    <cbc:ID><xsl:value-of select="$ID"/></cbc:ID>
                </xsl:when>
                <xsl:otherwise>
                    <cbc:ID><xsl:value-of select="cbc:ID"/>-response</cbc:ID>
                </xsl:otherwise>
            </xsl:choose>

            <cbc:IssueDate><xsl:value-of select="format-date(current-date(),
                          '[Y0001]-[M01]-[D01]')"/></cbc:IssueDate>

            <cbc:IssueTime><xsl:value-of select="format-dateTime(current-dateTime(),
                          '[H01]:[m01]:[s01]')"/></cbc:IssueTime>

            <cbc:Note><xsl:value-of select="cbc:Note"/></cbc:Note>


            <xsl:apply-templates select="cac:ReceiverParty"/>
            <xsl:apply-templates select="cac:SenderParty"/>


            <cac:DocumentResponse>
                <cac:Response>
                    <cbc:ResponseCode><xsl:value-of select="cbc:ResponseCode"/></cbc:ResponseCode>
                </cac:Response>
                <cac:DocumentReference>
                    <cbc:ID>
                        <xsl:value-of select="cbc:ID"/>
                    </cbc:ID>
                    <cbc:VersionID>
                        <xsl:value-of select="$VersionID"/>
                    </cbc:VersionID>
                </cac:DocumentReference>
            </cac:DocumentResponse>



        </ApplicationResponse>
    </xsl:template>


    <xsl:template match="cac:SenderParty">
        <cac:ReceiverParty>
            <xsl:apply-templates select="cac:Party/cbc:EndpointID"/>
            <xsl:apply-templates select="cac:Party/cac:PartyIdentification"/>
            <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity"/>
        </cac:ReceiverParty>
    </xsl:template>

    <xsl:template match="cac:ReceiverParty">
        <cac:SenderParty>
            <xsl:apply-templates select="cac:Party/cbc:EndpointID"/>
            <xsl:apply-templates select="cac:Party/cac:PartyIdentification"/>
            <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity"/>
        </cac:SenderParty>
    </xsl:template>

    <xsl:template match="cbc:*">
        <xsl:element name="cbc:{local-name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="cac:*">
        <xsl:element name="cac:{local-name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="@*|text()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>