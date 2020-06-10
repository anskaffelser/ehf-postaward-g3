#!/bin/sh

mkdir /target/schematron/forward-billing-3.0
cp /target/schematron-peppol/FORWARD-BILLING* /target/schematron/forward-billing-3.0/

mkdir -p /target/schematron/reminder-3.0
cp /target/schematron-peppol/REMINDER* /target/schematron/reminder-3.0/


for f in $(find /target/schematron -type f); do
    echo $f

    echo '<?xml version="1.0" encoding="UTF-8"?>' > $f.tmp
    cat <<EOF >> $f.tmp
<!--

This file is distributed as part of $TITLE.

Release: $RELEASE
Timestamp: $TIMESTAMP

Repository for releases and issues:
  https://github.com/anskaffelser/ehf-postaward-g3
-->
EOF

    cat $f | sed 's:<?xml version="1.0" encoding="UTF-8"?>::g' >> $f.tmp
    mv $f.tmp $f
done

cat <<EOF >> /target/schematron/README
This archive contains Schematron files distributed as part of $TITLE.

Release: $RELEASE
Timestamp: $TIMESTAMP

Repository for releases and issues:
  https://github.com/anskaffelser/ehf-postaward-g3
EOF