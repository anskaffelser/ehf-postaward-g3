<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
    <rule context="cbc:PrepaidAmount">
        <assert id="EHF-PR-R002"
                test="number(text()) >= 0"
                flag="fatal">Prepaid amount MUST be positive.</assert>
    </rule>

    <rule context="cac:LegalMonetaryTotal">
        <assert id="EHF-PR-R001"
                test="number(cbc:LineExtensionAmount) - (if (cbc:PrepaidAmount) then number(cbc:PrepaidAmount) else 0) = number(cbc:PayableAmount)"
                flag="fatal">Payable amount MUST be the line total minus prepaid amount.</assert>
    </rule>
</pattern>
