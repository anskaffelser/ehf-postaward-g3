<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xi="http://www.w3.org/2001/XInclude"
				xmlns:u="utils"
				schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Catalogue 3.0</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
	<ns prefix="u" uri="utils"/>

	<!-- Functions -->

	<xi:include href="../../../source/poacc-upgrade/rules/sch/parts/function/gln.xml"/>
	<xi:include href="../../../source/poacc-upgrade/rules/sch/parts/function/slack.xml"/>

	<!-- Rules -->

	<include href="../../_common/sch/parts/empty-elements.sch"/>
	<include href="../../../target/generated/t19-basic.sch"/>
	<include href="../../../source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T19.sch"/>
	<!-- <include href="business/EHF-REMINDER.sch"/> -->

</schema>