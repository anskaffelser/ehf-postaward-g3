<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"
                exclude-result-prefixes="xs ubl">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="ID"/>
    <xsl:param name="Note"/>
    <xsl:param name="cbc:ResponseCode"/>
    <xsl:param name="Response"/>
    <xsl:param name="VersionID"/>
    <xsl:param name="InputCode"/>

    <xsl:template match="/ubl:*">
        <ApplicationResponse>
            <cbc:CustomizationID>urn:fdc:peppol.eu:poacc:trns:catalogue_response:3:extended:urn:fdc:difi.no:2017:ehf:spec:3.0</cbc:CustomizationID>
            <cbc:ProfileID>urn:fdc:difi.no:2019:ehf:postaward:g3:01:1.0</cbc:ProfileID>

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

            <!--<cbc:Note>...</cbc:Note>-->


            <xsl:apply-templates select="cac:ReceiverParty"/>

            <xsl:apply-templates select="cac:ProviderParty"/>


            <cac:DocumentResponse>
                <cac:Response>
                    <cbc:ResponseCode>AP</cbc:ResponseCode>
                </cac:Response>
                <cac:DocumentReference>
                    <cbc:ID>
                        <xsl:value-of select="cbc:ID"/>
                    </cbc:ID>
                    <cbc:VersionID>
                        <xsl:value-of select="cbc:VersionID"/>
                    </cbc:VersionID>
                </cac:DocumentReference>
            </cac:DocumentResponse>


        </ApplicationResponse>
    </xsl:template>

    <xsl:template match="cac:ReceiverParty">
        <cac:SenderParty>
            <xsl:apply-templates select="cbc:EndpointID"/>
            <xsl:apply-templates select="cac:PartyIdentification"/>
            <cac:PartyLegalEntity>
                <xsl:apply-templates select="cac:PartyLegalEntity/cbc:RegistrationName"/>
            </cac:PartyLegalEntity>
        </cac:SenderParty>
    </xsl:template>

    <xsl:template match="cac:ProviderParty">
        <cac:ReceiverParty>
                <xsl:apply-templates select="cbc:EndpointID"/>
                <xsl:apply-templates select="cac:PartyIdentification"/>
            <cac:PartyLegalEntity>
                <xsl:apply-templates select="cac:PartyLegalEntity/cbc:RegistrationName"/>
            </cac:PartyLegalEntity>
        </cac:ReceiverParty>
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