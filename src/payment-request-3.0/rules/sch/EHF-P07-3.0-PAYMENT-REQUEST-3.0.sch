<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xi="http://www.w3.org/2001/XInclude"
				xmlns:u="utils"
				schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Payment Request 3.0</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
	<ns prefix="u" uri="utils"/>

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
	<include href="../../../../target/generated/p07-request-basic.sch"/>
	<include href="../../../_common/rules/sch/parts/identifiers.sch"/>
	<include href="business/payment-request.sch"/>

</schema>
