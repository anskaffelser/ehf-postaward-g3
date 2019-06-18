<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
    <rule context="cbc:EndpointID[@schemeID = '0192'] | cac:PartyIdentification/cbc:ID[@schemeID = '0192'] | cbc:CompanyID[@schemeID = '0192']">
        <assert id="EHF-COMMON-R003"
                test="matches(normalize-space(), '^[0-9]{9}$') and u:mod11(normalize-space())"
                flag="fatal">MUST be a valid Norwegian organization number. Only numerical value allowed</assert>
    </rule>
</pattern>
