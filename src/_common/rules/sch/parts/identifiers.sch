<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">

    <!-- Norwegian rules -->

    <rule context="cbc:EndpointID[@schemeID = '0192'] | cac:PartyIdentification/cbc:ID[@schemeID = '0192'] | cbc:CompanyID[@schemeID = '0192']">
        <assert id="EHF-COMMON-R003"
                test="matches(normalize-space(), '^[0-9]{9}$') and u:mod11(normalize-space())"
                flag="fatal">MUST be a valid Norwegian organization number. Only numerical value allowed</assert>
    </rule>

    <!-- From OpenPeppol -->

    <rule context="/*">
        <assert id="PEPPOL-COMMON-R003"
                test="not(@*:schemaLocation)"
                flag="warning">Document SHOULD not contain schema location.</assert>

    </rule>

    <rule context="cbc:IssueDate | cbc:DueDate | cbc:TaxPointDate | cbc:StartDate | cbc:EndDate | cbc:ActualDeliveryDate">
        <assert id="PEPPOL-COMMON-R030"
                test="(string(.) castable as xs:date) and (string-length(.) = 10)"
                flag="fatal">A date must be formatted YYYY-MM-DD.</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = '0088'] | cac:PartyIdentification/cbc:ID[@schemeID = '0088'] | cbc:CompanyID[@schemeID = '0088']">
        <assert id="PEPPOL-COMMON-R040"
                test="matches(normalize-space(), '^[0-9]+$') and u:gln(normalize-space())"
                flag="fatal">GLN must have a valid format according to GS1 rules.</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = '0208'] | cac:PartyIdentification/cbc:ID[@schemeID = '0208'] | cbc:CompanyID[@schemeID = '0208']">
      <assert id="PEPPOL-COMMON-R043" test="matches(normalize-space(), '^[0-9]{10}$') and u:mod97-0208(normalize-space())" flag="fatal">Belgian enterprise number MUST be stated in the correct format.</assert>
    </rule>	
    <rule context="cbc:EndpointID[@schemeID = '0201'] | cac:PartyIdentification/cbc:ID[@schemeID = '0201'] | cbc:CompanyID[@schemeID = '0201']">
      <assert id="PEPPOL-COMMON-R044" test="u:checkCodiceIPA(normalize-space())" flag="warning">IPA Code (Codice Univoco Unità Organizzativa) must be stated in the correct format</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = '0210'] | cac:PartyIdentification/cbc:ID[@schemeID = '0210'] | cbc:CompanyID[@schemeID = '0210']">
      <assert id="PEPPOL-COMMON-R045" test="u:checkCF(normalize-space())" flag="warning">Tax Code (Codice Fiscale) must be stated in the correct format</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = '9907']">
      <assert id="PEPPOL-COMMON-R046" test="u:checkCF(normalize-space())" flag="warning">Tax Code (Codice Fiscale) must be stated in the correct format</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = '0211'] | cac:PartyIdentification/cbc:ID[@schemeID = '0211'] | cbc:CompanyID[@schemeID = '0211']">
      <assert id="PEPPOL-COMMON-R047" test="u:checkPIVAseIT(normalize-space())" flag="warning">Italian VAT Code (Partita Iva) must be stated in the correct format</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = '9906']">
      <assert id="PEPPOL-COMMON-R048" test="u:checkPIVAseIT(normalize-space())" flag="warning">Italian VAT Code (Partita Iva) must be stated in the correct format</assert>
    </rule>
    <rule context="cbc:EndpointID[@schemeID = '0007'] | cac:PartyIdentification/cbc:ID[@schemeID = '0007'] | cbc:CompanyID[@schemeID = '0007']">
      <assert id="PEPPOL-COMMON-R049" test="string-length(normalize-space()) = 10 and string(number(normalize-space())) != 'NaN'" flag="warning">Swedish organization number MUST be stated in the correct format.</assert>     
    </rule> 
    <rule context="cbc:EndpointID[@schemeID = '0151'] | cac:PartyIdentification/cbc:ID[@schemeID = '0151'] | cbc:CompanyID[@schemeID = '0151']">
      <assert id="PEPPOL-COMMON-R050" test="u:abn(normalize-space())" flag="warning">Australian Business Number (ABN) MUST be stated in the correct format.</assert>
    </rule> 

    <!-- Specific for EHF G3 release 2022-06-15: -->

    <let name="ICD_ADDED" value="tokenize('0194 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 0214 0215 0216', '\s')"/>
    <let name="EAS_ADDED" value="tokenize('0130 0147 0151 0170 0183 0188 0201 0202 0204 0208 0209 0210 0211 0212 0213 0215 0216', '\s')"/>
    <let name="EAS_DEPRECATED" value="tokenize('9902 9904 9905 9917 9921 9956 9958', '\s')"/>
    <let name="IMAGE_ADDED" value="tokenize('TRADE_ITEM_DESCRIPTION', '\s')"/>
    <let name="ISO3166_ADDED" value="tokenize('1A XI', '\s')"/>
    <let name="UNCL7143_ADDED" value="tokenize('TSQ TSR TSS TST TSU', '\s')"/>
    <let name="UNECERec20_ADDED" value="tokenize('DBM DBW FNU HMO HWE IUG KWN KWS KWY MKD MKM MKW MNJ MQD MQM MQW MRD MRW MTZ NTU ODG ODK ODM Q41 Q42 Z9 X01 X02 X03 X04 X05 X06 X07 X08 X09 XOG XOH XOI XOJ XOL XOM XON XOP XOQ XOR XOS XOV XOW XOX XOY XOZ XP1 XP3 XP4 XSX XZZ', '\s')"/>
    <let name="UNECERec21_ADDED" value="tokenize('01 02 03 04 05 06 07 08 09 OG OH OI OJ OM ON OP OQ OR OS OV OW OX OY OZ P1 P3 P4 SX', '\s')"/>

    <!-- ICD -->
    <rule context="cac:PartyIdentification/cbc:ID/@schemeID | cac:PartyLegalEntity/cbc:CompanyID/@schemeID | cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID | cac:Delivery/cac:DeliveryLocation/cbc:ID/@schemeID">
      <assert id="EHF-CL-N001" test="not(@schemeID) or not(some $code in $ICD_ADDED satisfies $code = @schemeID)" flag="fatal">Code will become available for usage in release autumn 2022.</assert>
    </rule>

    <!-- EAS -->
    <rule context="cbc:EndpointID">
      <assert id="EHF-CL-N002" test="not(@schemeID) or not(some $code in $EAS_ADDED satisfies $code = @schemeID)" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
      <assert id="EHF-CL-N003" test="not(@schemeID) or not(some $code in $EAS_DEPRECATED satisfies $code = @schemeID)" flag="warning">Code is deprecated and will become removed as part of release autumn 2022.</assert>
    </rule>

    <!-- IMAGE -->
    <rule context="cac:CatalogueLine/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentTypeCode">
      <assert id="EHF-CL-N004" test="not(some $code in $IMAGE_ADDED satisfies $code = normalize-space())" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
    </rule>

    <!-- ISO3166 -->
    <rule context="cac:Country/cbc:IdentificationCode | cac:OriginCountry/cbc:IdentificationCode">
      <assert id="EHF-CL-N005" test="not(some $code in $ISO3166_ADDED satisfies $code = normalize-space())" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
    </rule>

    <!-- UNCL7143 -->
    <rule context="cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode">
      <assert id="EHF-CL-N006" test="not(@listID) or not(some $code in $UNCL7143_ADDED satisfies $code = @listID)" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
    </rule>

    <!-- UNECERec20 -->
    <rule context="cac:CatalogueLine/cbc:OrderableUnit">
      <assert id="EHF-CL-N007" test="not(some $code in $UNECERec20_ADDED satisfies $code = normalize-space())" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
    </rule>
    <rule context="cac:CatalogueLine/cbc:OrderableUnit | cac:CatalogueLine/cbc:ContentUnitQuantity | cac:CatalogueLine/cbc:MinimumOrderQuantity | cac:CatalogueLine/cbc:MaximumOrderQuantity | cac:CatalogueLine/cac:ItemComparison/cbc:Quantity | cac:CatalogueLine/cac:ComponentRelatedItem/cbc:Quantity | cac:CatalogueLine/cac:AccessoryRelatedItem/cbc:Quantity | cac:CatalogueLine/cac:RequiredRelatedItem/cbc:Quantity | cac:CatalogueLine/cac:ReplacedRelatedItem/cbc:Quantity | cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:LeadTimeMeasure | cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MinimumQuantity | cac:CatalogueLine/cac:RequiredItemLocationQuantity/cbc:MaximumQuantity | cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cbc:BaseQuantity | cac:CatalogueLine/cac:Item/cbc:PackQuantity | cac:CatalogueLine/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity | cac:CatalogueLine/cac:Item/cac:Dimension/cbc:Measure | cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MinimumMeasure | cac:CatalogueLine/cac:Item/cac:Dimension/cbc:MaximumMeasure | cac:Shipment/cbc:GrossWeightMeasure | cac:Shipment/cbc:GrossVolumeMeasure | cac:DespatchLine/cbc:DeliveredQuantity | cac:DespatchLine/cbc:OutstandingQuantity | cac:DespatchLine/cac:Item/cbc:ValueQuantity | cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cac:MeasurementDimension/cbc:Measure | cac:OrderLine/cac:LineItem/cbc:Quantity | cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity | cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity | cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity | cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity | cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:DeliveryUnit/cbc:BatchQuantity | cac:InvoiceLine/cbc:InvoicedQuantity | cac:InvoiceLine/cac:Price/cbc:BaseQuantity">
      <assert id="EHF-CL-N008" test="not(@unitCode) or not(some $code in $UNECERec20_ADDED satisfies $code = @unitCode)" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
    </rule>

    <!-- UNECERec21 -->
    <rule context="cac:DespatchLine/cac:Shipment/cac:TransportHandlingUnit/cbc:TransportHandlingUnitTypeCode">
      <assert id="EHF-CL-N009" test="not(some $code in $UNECERec21_ADDED satisfies $code = normalize-space())" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
    </rule>
    <rule context="cac:InvoiceLine/cbc:InvoicedQuantity | cac:InvoiceLine/cac:Price/cbc:BaseQuantity">
      <assert id="EHF-CL-N010" test="not(@unitCode) or not(some $code in $UNECERec21_ADDED satisfies $code = @unitCode)" flag="fatal">Code is not to be used before release in autumn 2022.</assert>
    </rule>

  </pattern>
