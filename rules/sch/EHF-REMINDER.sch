<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2"
	schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Reminder</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

	<include href="../../target/generated/reminder-basic.sch"/>

	<!-- TODO -->

</schema>
