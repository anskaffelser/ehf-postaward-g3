<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xi="http://www.w3.org/2001/XInclude"
		xmlns:u="utils"
		schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Common 3.0</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
	<ns prefix="u" uri="utils"/>

	<!-- Functions -->

	<xi:include href="../function/abn.xml"/>
	<xi:include href="../function/addPIVA.xml"/>
	<xi:include href="../function/cat2str.xml"/>
	<xi:include href="../function/checkCF.xml"/>
	<xi:include href="../function/checkCF16.xml"/>
	<xi:include href="../function/checkCodiceIPA.xml"/>
	<xi:include href="../function/checkPIVA.xml"/>
	<xi:include href="../function/checkPIVAseIT.xml"/>
	<xi:include href="../function/gln.xml"/>
	<xi:include href="../function/mod11.xml"/>
	<xi:include href="../function/mod97-0208.xml"/>
	<xi:include href="../function/slack.xml"/>

	<!-- Rules -->

	<include href="empty-elements.sch"/>
	<include href="identifiers.sch"/>

</schema>
