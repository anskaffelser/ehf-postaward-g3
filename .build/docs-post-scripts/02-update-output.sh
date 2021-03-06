#!/bin/sh

# EHF Catalogue 3.0
sed -i \
  -e 's|../../shared/images/|images/|g' \
  -e 's|PEPPOL BIS|EHF|g' \
  -e 's|BIS|EHF|g' \
  -e 's|UBL 2.1|UBL 2.2|g' \
  -e 's|UBL-2.1|UBL-2.2|g' \
  -e 's|        |  |g' \
  /target/site/catalogue-3.0/guide/index.html

# EHF Despatch Advice 3.0
sed -i \
  -e 's|../../shared/images/|images/|g' \
  -e 's|PEPPOL BIS|EHF|g' \
  -e 's|BIS|EHF|g' \
  -e 's|UBL 2.1|UBL 2.2|g' \
  -e 's|UBL-2.1|UBL-2.2|g' \
  -e 's|        |  |g' \
  /target/site/despatch-advice-3.0/guide/index.html

# EHF Ordering 3.0
sed -i \
  -e 's|../../shared/images/|images/|g' \
  -e 's|PEPPOL BIS|EHF|g' \
  -e 's|BIS|EHF|g' \
  -e 's|UBL 2.1|UBL 2.2|g' \
  -e 's|UBL-2.1|UBL-2.2|g' \
  -e 's|        |  |g' \
  /target/site/ordering-3.0/guide/index.html

# EHF Order Agreement 3.0
sed -i \
  -e 's|../../shared/images/|images/|g' \
  -e 's|PEPPOL BIS|EHF|g' \
  -e 's|BIS|EHF|g' \
  -e 's|UBL 2.1|UBL 2.2|g' \
  -e 's|UBL-2.1|UBL-2.2|g' \
  -e 's|        |  |g' \
  /target/site/order-agreement-3.0/guide/index.html

# EHF Punch Out 3.0
sed -i \
  -e 's|../../shared/images/|images/|g' \
  -e 's|PEPPOL BIS|EHF|g' \
  -e 's|BIS|EHF|g' \
  -e 's|UBL 2.1|UBL 2.2|g' \
  -e 's|UBL-2.1|UBL-2.2|g' \
  -e 's|        |  |g' \
  /target/site/punch-out-3.0/guide/index.html
