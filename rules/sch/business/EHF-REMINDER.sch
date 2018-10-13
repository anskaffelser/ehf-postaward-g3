<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
	<rule context="cac:ReminderLine">
		<assert id="EHF-R001"
				test="count(cbc:DebitLineAmount | cbc:CreditLineAmount) = 1"
				flag="fatal">Reminder line must contain either debit line amount or credit line amount.</assert>
	</rule>
</pattern>
