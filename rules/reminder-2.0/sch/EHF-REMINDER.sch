<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Reminder 2.0</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Reminder-2"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

	<include href="common/empty-elements.sch"/>
	<include href="../../../target/generated/reminder-basic.sch"/>
	<include href="business/EHF-REMINDER.sch"/>

</schema>
