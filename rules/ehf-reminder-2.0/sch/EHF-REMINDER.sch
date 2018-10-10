<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" schemaVersion="iso" queryBinding="xslt2">

	<title>EHF Reminder 2.0</title>

	<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
	<ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
	<ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2"/>
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

	<include href="../../target/generated/reminder-basic.sch"/>


	<pattern>
		<rule context="cac:ReminderLine">
			<assert id="EHF-R001"
					test="count(cbc:DebitLineAmount | cbc:CreditLineAmount) = 1"
					flag="fatal">Reminder line must contain either debit line amount or credit line amount.</assert>
		</rule>
	</pattern>


</schema>
