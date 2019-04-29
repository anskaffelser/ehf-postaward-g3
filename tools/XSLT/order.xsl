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
    <xsl:param name="SalesOrderID"/>
    <xsl:param name="OrderResponseCode"/>
    <xsl:param name="Note"/>
    <xsl:param name="CustomerReference"/>


    <xsl:template match="/ubl:*">
        <OrderResponse>
            <cbc:CustomizationID>urn:fdc:peppol.eu:poacc:trns:order_response:3</cbc:CustomizationID>
            <cbc:ProfileID>urn:fdc:peppol.eu:poacc:bis:ordering:3</cbc:ProfileID>

            <xsl:choose>
                <xsl:when test = "$ID != '' " >
                    <cbc:ID><xsl:value-of select="$ID"/></cbc:ID>
                </xsl:when>
                <xsl:otherwise>
                    <cbc:ID><xsl:value-of select="cbc:ID"/>-response</cbc:ID>
                </xsl:otherwise>
            </xsl:choose>

            <cbc:SalesOrderID><xsl:value-of select="cbc:SalesOrderID"/></cbc:SalesOrderID>


            <cbc:IssueDate><xsl:value-of select="format-date(current-date(),
                          '[Y0001]-[M01]-[D01]')"/></cbc:IssueDate>

            <cbc:IssueTime><xsl:value-of select="format-dateTime(current-dateTime(),
                          '[H01]:[m01]:[s01]')"/></cbc:IssueTime>


            <cbc:OrderResponseCode><xsl:value-of select="cbc:OrderResponseCode"/></cbc:OrderResponseCode>

            <cbc:Note><xsl:value-of select="cbc:Note"/></cbc:Note>

            <cbc:DocumentCurrencyCode><xsl:value-of select="cbc:DocumentCurrencyCode"/></cbc:DocumentCurrencyCode>

            <cbc:CustomerReference><xsl:value-of select="cbc:CustomerReference"/></cbc:CustomerReference>

            <cac:OrderReference>
                <cbc:ID>
                    <xsl:value-of select="cbc:ID"/>
                </cbc:ID>
            </cac:OrderReference>

            <xsl:apply-templates select="cac:SellerSupplierParty"/>
            <xsl:apply-templates select="cac:BuyerCustomerParty"/>
            <xsl:apply-templates select="cac:Delivery/cac:RequestedDeliveryPeriod"/>
            <xsl:apply-templates select="cac:OrderLine"/>


        </OrderResponse>
    </xsl:template>


    <xsl:template match="cac:OrderLine">
        <cac:OrderLine>
            <cac:LineItem>
                <xsl:apply-templates select="cbc:ID"/>
                <xsl:apply-templates select="cbc:Note"/>
                <xsl:apply-templates select="cbc:LineStatusCode"/>

                <xsl:apply-templates select="cbc:Quantity"/>
                <xsl:apply-templates select="cbc:MaximumBackorderQuantity"/>

                <xsl:apply-templates select="cac:Delivery/cac:PromisedDeliveryPeriod"/>


                <xsl:apply-templates select="cac:Price/cbc:PriceAmount"/>
                <xsl:apply-templates select="cac:Price/cbc:BaseQuantity"/>


                <xsl:apply-templates select="cac:Item/cbc:Name"/>
                <xsl:apply-templates select="cac:Item/cac:BuyerItemIdentification"/>
                <xsl:apply-templates select="cac:Item/cac:SellerItemIdentification"/>
                <xsl:apply-templates select="cac:Item/cac:StandardItemIdentification"/>

            </cac:LineItem>

            <cac:SellerSubstitutedLineItem>
                <xsl:apply-templates select="cbc:ID"/>

                <xsl:apply-templates select="cac:Item/cbc:Name"/>
                <xsl:apply-templates select="cac:Item/cac:SellerItemIdentification"/>
                <xsl:apply-templates select="cac:Item/cac:CommodityClassification"/>

                <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>
                <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>
                <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme"/>

                <xsl:apply-templates select="cac:Item/cac:AdditionalItemProperty"/>
            </cac:SellerSubstitutedLineItem>

            <xsl:apply-templates select="cac:OrderLineReference"/>
        </cac:OrderLine>
    </xsl:template>



    <xsl:template match="cac:Delivery/cac:RequestedDeliveryPeriod">
        <cac:Delivery>
            <cbc:PromisedDeliveryPeriod>
                <xsl:apply-templates select="cbc:StartDate"/>
                <xsl:apply-templates select="cbc:EndDate"/>
            </cbc:PromisedDeliveryPeriod>
        </cac:Delivery>
    </xsl:template>


    <xsl:template match="cac:SellerSupplierParty">
        <cac:SellerSupplierParty>
            <xsl:apply-templates select="cac:Party/cbc:EndpointID"/>
            <xsl:apply-templates select="cac:Party/cac:PartyIdentification"/>
            <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity"/>
        </cac:SellerSupplierParty>
    </xsl:template>

    <xsl:template match="cac:BuyerCustomerParty">
        <cac:BuyerCustomerParty>
            <xsl:apply-templates select="cac:Party/cbc:EndpointID"/>
            <xsl:apply-templates select="cac:Party/cac:PartyIdentification"/>
            <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity"/>
        </cac:BuyerCustomerParty>
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