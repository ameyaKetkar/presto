#!/bin/bash
echo "Running Phase 1 to collect relevant TFGs from the compilation units"

cd /home/t2r/Artifacts/presto/presto-spi/

mvn clean install -DskipTests

echo "Collected TFGs"

cd /home/t2r/error-prone/core/

mvn exec:java -Dexec.args="/home/t2r/Artifacts/presto/t2r/"

echo "Refactorables Collected"

echo "Now Generating patches"

cd -

mvn clean install -Dmaven.test.skip=true

echo "Packages generated"

patch -p0 -u -i error-prone.patch

echo "Applied patches, please check GitKraken to visualises the changes applied. To verify if the changes are correct please run TestSuccess.sh scripts"



