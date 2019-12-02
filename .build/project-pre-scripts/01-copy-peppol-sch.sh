#!/bin/sh

test ! -e /target/schematron-peppol || rm -r /target/schematron-peppol

mkdir -p /target/schematron-peppol

schutil exclude \
  /src/_source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T01.sch \
  /target/schematron-peppol/PEPPOL-M-T01.sch \
  PEPPOL-T01-R031

#schutil exclude \
cp \
  /src/_source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T16.sch \
  /target/schematron-peppol/PEPPOL-M-T16.sch

schutil exclude \
  /src/_source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T19.sch \
  /target/schematron-peppol/PEPPOL-M-T19.sch \
  PEPPOL-T19-R017

#schutil exclude \
cp \
  /src/_source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T76.sch \
  /target/schematron-peppol/PEPPOL-M-T76.sch

#schutil exclude \
cp \
  /src/_source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T77.sch \
  /target/schematron-peppol/PEPPOL-M-T77.sch

#schutil exclude \
cp \
  /src/_source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T110.sch \
  /target/schematron-peppol/PEPPOL-M-T110.sch

# Invoice Z02
#cp \
#  /src/_source/poacc-billing/rules/sch/CEN-EN16931-UBL.sch \
#  /target/schematron-peppol/CEN-EN16931-UBL.sch
#schutil exclude \
#  /src/_source/poacc-billing/rules/sch/PEPPOL-EN16931-UBL.sch \
#  /target/schematron-peppol/PEPPOL-EN16931-UBL.sch \
#  PEPPOL-EN16931-R007


# Reminder
schutil exclude \
  /src/_source/poacc-billing/rules/sch/CEN-EN16931-UBL.sch \
  /target/schematron-peppol/REMINDER-CEN-EN16931-UBL.sch \
  BR-04
schutil exclude \
  /src/_source/poacc-billing/rules/sch/PEPPOL-EN16931-UBL.sch \
  /target/schematron-peppol/REMINDER-PEPPOL-EN16931-UBL.sch \
  PEPPOL-EN16931-R007,PEPPOL-EN16931-CL003

# Forward Billing
schutil exclude \
  /src/_source/poacc-billing/rules/sch/CEN-EN16931-UBL.sch \
  /target/schematron-peppol/FORWARD-BILLING-CEN-EN16931-UBL.sch \
  BR-07
schutil exclude \
  /src/_source/poacc-billing/rules/sch/PEPPOL-EN16931-UBL.sch \
  /target/schematron-peppol/FORWARD-BILLING-PEPPOL-EN16931-UBL.sch \
  PEPPOL-EN16931-R007
