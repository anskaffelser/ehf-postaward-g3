<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xi="http://www.w3.org/2001/XInclude"
				xmlns:u="utils"
				schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Payment Request 3.0</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"/>
	<ns prefix="sh" uri="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
	<ns prefix="u" uri="utils"/>

	<!-- Functions -->

	<xi:include href="../../_common/sch/function/gln.xml"/>
	<xi:include href="../../_common/sch/function/mod11.xml"/>

	<!-- Rules -->

	<include href="../../_common/sch/parts/empty-elements.sch"/>
	<include href="../../../target/generated/pr-basic.sch"/>
	<include href="../../_common/sch/parts/identifiers.sch"/>
	<include href="business/payment-request.sch"/>

</schema>
