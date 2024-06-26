<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xi="http://www.w3.org/2001/XInclude"
				xmlns:u="utils"
				schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Order Response 3.0</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
	<ns prefix="u" uri="utils"/>

	<!-- Variables -->

	<xsl:key name="k_lineId"  match="cac:LineItem" use="cbc:ID"/>

	<!-- Functions -->

	<xi:include href="../../../_common/rules/sch/function/abn.xml"/>
	<xi:include href="../../../_common/rules/sch/function/addPIVA.xml"/>
	<xi:include href="../../../_common/rules/sch/function/cat2str.xml"/>
	<xi:include href="../../../_common/rules/sch/function/checkCF.xml"/>
	<xi:include href="../../../_common/rules/sch/function/checkCF16.xml"/>
	<xi:include href="../../../_common/rules/sch/function/checkCodiceIPA.xml"/>
	<xi:include href="../../../_common/rules/sch/function/checkPIVA.xml"/>
	<xi:include href="../../../_common/rules/sch/function/checkPIVAseIT.xml"/>
	<xi:include href="../../../_common/rules/sch/function/gln.xml"/>
	<xi:include href="../../../_common/rules/sch/function/mod11.xml"/>
	<xi:include href="../../../_common/rules/sch/function/mod97-0208.xml"/>
	<xi:include href="../../../_common/rules/sch/function/slack.xml"/>

	<!-- Rules -->

	<include href="../../../_common/rules/sch/parts/empty-elements.sch"/>
	<include href="../../../../target/generated/t76-basic.sch"/>
	<include href="../../../_common/rules/sch/parts/identifiers.sch"/>
	<include href="../../../../target/schematron-peppol/PEPPOL-M-T76.sch"/>
	<include href="../../../_common/rules/qii/order_response_3x_pattern.sch"/>

</schema>
