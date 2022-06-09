#!/bin/sh

xslt -s:src/_common/codelist/source/PackagingMarkedLabelAccreditationCode.xml \
    -xsl:src/_common/xslt/gs1cl-to-codelist.xslt \
    -o:src/_common/codelist/PackagingMarkedLabelAccreditationCode.xml \
