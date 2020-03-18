<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Order-2"
                exclude-result-prefixes="xs ubl">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="ID"/>
    <xsl:param name="SalesOrderID"/>
    <xsl:param name="OrderResponseCode"/>
    <xsl:param name="Note"/>
    <xsl:param name="CustomerReference"/>
    <xsl:param name="Quantity"/>
    <xsl:param name="cac:OrderLine"/>

    <xsl:template match="/ubl:*">
        <OrderResponse>
            <cbc:CustomizationID>urn:fdc:peppol.eu:poacc:trns:order_response:3:extended:urn:fdc:difi.no:2017:ehf:spec:3.0</cbc:CustomizationID>
            <cbc:ProfileID>urn:fdc:difi.no:2019:ehf:postaward:g3:02:1.0</cbc:ProfileID>

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


            <cbc:OrderResponseCode>AP</cbc:OrderResponseCode>

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


            <!--
            <cac:OrderLine>

                <cac:LineItem>
                    <cbc:ID>
                        <xsl:value-of select="cbc:ID"/>
                    </cbc:ID>

                    <cbc:Note>
                        <xsl:value-of select="cac:OrderLine/cac:LineItem/cbc:Note"/>
                    </cbc:Note>

                    <cbc:LineStatusCode>
                        <xsl:value-of select="cac:OrderLine/cac:LineItem/cbc:LineStatusCode"/>
                    </cbc:LineStatusCode>

                    <xsl:apply-templates select="cac:OrderLine/cac:LineItem"/>

                    <cbc:MaximumBackOrderQuantity>
                        <xsl:value-of select="cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity"/>
                    </cbc:MaximumBackOrderQuantity>

                    <xsl:apply-templates select="cac:OrderLine/cac:LineItem/cac:Delivery"/>

                    <xsl:apply-templates select="cac:OrderLine/cac:LineItem/cac:Price"/>

                    <cac:Item>
                        <xsl:apply-templates select="cac:OrderLine/cac:LineItem/cac:Item"/>
                    </cac:Item>
                </cac:LineItem>

            </cac:OrderLine>
          -->

            <xsl:apply-templates select="cac:OrderLine"/>


        </OrderResponse>
    </xsl:template>

   <xsl:template match="cac:OrderLine">
       <cac:OrderLine>
           <cac:LineItem>
               <cbc:ID>
                   <xsl:value-of select="cac:LineItem/cbc:ID"/>
               </cbc:ID>

               <cbc:LineStatusCode>5</cbc:LineStatusCode>

               <xsl:apply-templates select="cac:LineItem/cbc:Quantity"/>


               <cac:Delivery>
                   <cac:PromisedDeliveryPeriod>
                       <xsl:apply-templates select="cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartDate"/>
                       <xsl:apply-templates select="cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndDate"/>
                   </cac:PromisedDeliveryPeriod>
               </cac:Delivery>

               <cac:Price>
                   <xsl:apply-templates select="cac:LineItem/cac:Price/cbc:PriceAmount"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Price/cbc:BaseQuantity"/>
               </cac:Price>

               <cac:Item>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cbc:Name"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:BuyersItemIdentification"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:SellersItemIdentification"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:StandardItemIdentification"/>
               </cac:Item>

           </cac:LineItem>

           <cac:SellerSubstitutedLineItem>
               <xsl:apply-templates select="cac:LineItem/cbc:ID"/>
               <cac:Item>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cbc:Name"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:SellersItemIdentification"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:StandardItemIdentification"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:CommodityClassification"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:ClassifiedTaxCategory"/>
                   <xsl:apply-templates select="cac:LineItem/cac:Item/cac:AdditionalItemProperty"/>
               </cac:Item>
           </cac:SellerSubstitutedLineItem>

            <cac:OrderLineReference>
                <cbc:LineID>
                    <xsl:value-of select="cac:LineItem/cbc:ID/text()"/>
                </cbc:LineID>
            </cac:OrderLineReference>
       </cac:OrderLine>

   </xsl:template>

    <!--
    <xsl:template match="cac:OrderLine/cac:SellerSubstitutedLineItem">
        <xsl:apply-templates select="cbc:ID"/>
        <xsl:apply-templates select="cac:Item"/>
    </xsl:template>

    <xsl:template match="cac:OrderLine/cac:OrderLineReference">
        <xsl:apply-templates select="cbc:LineID"/>
    </xsl:template>

    <xsl:template match="cac:OrderLine/cac:LineItem">
        <xsl:apply-templates select="cbc:Quantity"/>
    </xsl:template>

    <xsl:template match="cac:OrderLine/cac:LineItem/cac:Item">
        <xsl:apply-templates select="cbc:Name"/>
        <xsl:apply-templates select="cac:BuyersItemIdentification"/>
        <xsl:apply-templates select="cac:SellersItemIdentification"/>
        <xsl:apply-templates select="cac:StandardItemIdentification"/>
    </xsl:template>

    <xsl:template match="cac:OrderLine/cac:LineItem/cac:Price">
        <cac:Price>
            <xsl:apply-templates select="cbc:PriceAmount"/>
            <xsl:apply-templates select="cbc:BaseQuantity"/>
        </cac:Price>
    </xsl:template>

    <xsl:template match="cac:OrderLine/cac:LineItem/cac:Delivery">
        <cac:Delivery>
            <cac:PromisedDeliveryPeriod>
                <xsl:apply-templates select="cac:RequestedDeliveryPeriod/cbc:StartDate"/>
                <xsl:apply-templates select="cac:RequestedDeliveryPeriod/cbc:EndDate"/>
            </cac:PromisedDeliveryPeriod>
        </cac:Delivery>
    </xsl:template>
-->

    <xsl:template match="cac:SellerSupplierParty">
        <cac:SellerSupplierParty>
            <cac:Party>
                <xsl:apply-templates select="cac:Party/cbc:EndpointID"/>
                <xsl:apply-templates select="cac:Party/cac:PartyIdentification"/>
                <cac:PartyLegalEntity>
                    <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
                </cac:PartyLegalEntity>
            </cac:Party>
        </cac:SellerSupplierParty>
    </xsl:template>

    <xsl:template match="cac:BuyerCustomerParty">
        <cac:BuyerCustomerParty>
            <cac:Party>
                <xsl:apply-templates select="cac:Party/cbc:EndpointID"/>
                <xsl:apply-templates select="cac:Party/cac:PartyIdentification"/>
                <cac:PartyLegalEntity>
                    <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
                </cac:PartyLegalEntity>
            </cac:Party>
        </cac:BuyerCustomerParty>
    </xsl:template>

    <xsl:template match="cac:Delivery/cac:RequestedDeliveryPeriod">
        <cac:Delivery>
            <cac:PromisedDeliveryPeriod>
                <xsl:apply-templates select="cbc:StartDate"/>
                <xsl:apply-templates select="cbc:EndDate"/>
            </cac:PromisedDeliveryPeriod>
        </cac:Delivery>
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