#!/bin/sh
# This is a generated file. Please make sure to edit source files.
trigger_asciidoctor() (
test ! -e .preasciidoctor.sh || . .preasciidoctor.sh
params=""
if [ "$DIAGRAM" = "true" ]; then
params="$params -r asciidoctor-diagram"
fi
for adoc in $(find . -name main.adoc -type f | sort); do
if [ ! -e "$(dirname $adoc)/.adocignore" ]; then
echo "Document: $adoc"
mkdir -p /target/$(dirname $adoc)
asciidoctor $params $adoc -o /target/$(dirname $adoc)/index.html
fi
done
find . -name .adocassets -type f | sort > /tmp/assets
while read assets; do
echo "Assets: $(dirname $assets)"
mkdir -p /target/$(dirname $(dirname $assets))
cp -r $(dirname $assets) /target/$(dirname $assets)
rm /target/$assets
done < /tmp/assets
test ! -e .postasciidoctor.sh || . .postasciidoctor.sh
)
trigger_environment() (
rm -f /target/env
append() {
echo export $1=\"$2\" >> /target/env
}
test ! -d /src/.git || append GIT $(git rev-parse HEAD)
append IDENTIFIER "$IDENTIFIER"
append RELEASE "$RELEASE"
append TIMESTAMP "$(date -u +"%Y-%m-%d %H:%Mz")"
append TITLE "$TITLE"
test ! -r /src/.build/script/environment.sh || . /src/.build/script/environment.sh
)
trigger_examples() (
test ! -r /target/env || . /target/env
rm -rf /target/examples
mkdir -p /target/examples /target/site/files
test ! -r /src/.build/template/examples-readme || cat /src/.build/template/examples-readme | envsubst > /target/examples/README
for folder in $(find src/*/rules -mindepth 1 -maxdepth 1 -name example -type d | sort); do
spec=$(echo $folder | cut -d '/' -f 2)
mkdir /target/examples/$spec
cp -r $folder/* /target/examples/$spec/
done
test ! -r /src/.build/script/examples.sh || . /src/.build/script/examples.sh
cd /target/examples
rm -rf /target/examples.zip
zip -q9r /target/examples.zip *
cp /target/examples.zip /target/site/files/examples.zip
)
trigger_schematron() (
test ! -r /target/env || . /target/env
rm -rf /target/schematron
mkdir -p /target/schematron /target/site/files
test ! -r /src/.build/template/schematron-readme || cat /src/.build/template/schematron-readme | envsubst > /target/schematron/README
for sch in $(ls /src/src/*/rules/sch/*.sch | sort); do
echo "Prepare: $sch"
spec=$(echo $sch | cut -d '/' -f 4)
mkdir -p /target/schematron/$spec
schematron prepare $sch /target/schematron/$spec/$(basename $sch)
done
test ! -r /src/.build/script/schematron.sh || . /src/.build/script/schematron.sh
cd /target/schematron
rm -rf /target/schematron.zip
zip -q9r /target/schematron.zip *
cp /target/schematron.zip /target/site/files/schematron.zip
)
trigger_xsd() (
test ! -r /target/env || . /target/env
rm -rf /target/xsd
mkdir -p /target/xsd /target/site/files
for folder in $(find /src/xsd -mindepth 1 -maxdepth 1 -type d | sort); do
name=$(basename $folder)
echo "Packaging $name"
cp -r $folder /tmp/$name
cd /tmp/$name
test ! -e prepare.sh || . prepare.sh
rm -rf prepare.sh
zip -9 -r /target/xsd/$name.zip *
cp /target/xsd/$name.zip /target/site/files/xsd-$name.zip
done
)
trigger_xslt() (
test ! -r /target/env || . /target/env
rm -rf /target/xslt
mkdir -p /target/xslt /target/site/files
for folder in $(find /src/xslt -mindepth 1 -maxdepth 1 -type d | sort); do
name=$(basename $folder)
echo "Packaging $name"
cp -r $folder /tmp/$name
cd /tmp/$name
test ! -e prepare.sh || . prepare.sh
rm -rf prepare.sh
zip -9 -r /target/xslt/$name.zip *
cp /target/xslt/$name.zip /target/site/files/xslt-$name.zip
done
)
trigger_scripts() (
test ! -r /target/env || . /target/env
for file in $(find /src/.build/$1-scripts -type f -name *.sh -maxdepth 1 | sort); do
cd /src
echo "> $(basename $file)"
. $file
done
)
trigger_static() (
cp -rv . /target
)
$*
