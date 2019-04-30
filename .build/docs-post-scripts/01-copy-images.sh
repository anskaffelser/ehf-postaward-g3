#!/bin/sh

# EHF Catalogue 3.0
mkdir -p /target/site/catalogue-3.0/guide/images

cp /src/source/poacc-upgrade/guides/profiles/1-catalogueonly/images/*.png \
  /src/source/poacc-upgrade/guides/profiles/1-catalogueonly/images/*.jpeg \
  source/poacc-upgrade/guides/shared/images/*.png \
  /target/site/catalogue-3.0/guide/images


# EHF Despatch Advice 3.0
mkdir -p /target/site/despatch-advice-3.0/guide/images

cp /src/source/poacc-upgrade/guides/profiles/30-despatchadvice/images/*.png \
  source/poacc-upgrade/guides/shared/images/*.png \
  /target/site/despatch-advice-3.0/guide/images


# EHF Ordering 3.0
mkdir -p /target/site/ordering-3.0/guide/images

cp /src/source/poacc-upgrade/guides/profiles/28-ordering/images/*.png \
  source/poacc-upgrade/guides/shared/images/*.png \
  /target/site/ordering-3.0/guide/images


# EHF Order Agreement 3.0
mkdir -p /target/site/order-agreement-3.0/guide/images

cp /src/source/poacc-upgrade/guides/profiles/42-orderagreement/images/*.png \
  /src/source/poacc-upgrade/guides/profiles/42-orderagreement/images/*.jpg \
  source/poacc-upgrade/guides/shared/images/*.png \
  /target/site/order-agreement-3.0/guide/images


# EHF Punch Out 3.0
mkdir -p /target/site/punch-out-3.0/guide/images

cp /src/source/poacc-upgrade/guides/profiles/18-punchout/images/*.png \
  source/poacc-upgrade/guides/shared/images/*.png \
  /target/site/punch-out-3.0/guide/images
