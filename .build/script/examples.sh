#!/bin/sh

for f in $(find /target/examples -type f); do
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

cat <<EOF >> /target/examples/README
This archive contains example files distributed as part of $TITLE.

Release: $RELEASE
Timestamp: $TIMESTAMP

Repository for releases and issues:
  https://github.com/anskaffelser/ehf-postaward-g3
EOF