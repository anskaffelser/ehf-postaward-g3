#!/bin/sh

test ! -e /target/schematron-peppol || rm -r /target/schematron-peppol

mkdir -p /target/schematron-peppol

schutil exclude \
  /src/source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T01.sch \
  /target/schematron-peppol/PEPPOL-M-T01.sch \
  PEPPOL-T01-R031

#schutil exclude \
cp \
  /src/source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T16.sch \
  /target/schematron-peppol/PEPPOL-M-T16.sch

schutil exclude \
  /src/source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T19.sch \
  /target/schematron-peppol/PEPPOL-M-T19.sch \
  PEPPOL-T19-R017

#schutil exclude \
cp \
  /src/source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T76.sch \
  /target/schematron-peppol/PEPPOL-M-T76.sch

#schutil exclude \
cp \
  /src/source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T77.sch \
  /target/schematron-peppol/PEPPOL-M-T77.sch

#schutil exclude \
cp \
  /src/source/poacc-upgrade/rules/sch/parts/PEPPOL-M-T110.sch \
  /target/schematron-peppol/PEPPOL-M-T110.sch
