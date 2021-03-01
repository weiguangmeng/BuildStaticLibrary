set -euo pipefail

UNREADY_PODSPEC="IGListKit.podspec\|IGListDiffKit"
PODSPEC_FILES=`find ./carthage/Checkouts/** -name "*.podspec" | grep -v ${UNREADY_PODSPEC}`
echo $PODSPEC_FILES

for file in $PODSPEC_FILES
do
    echo $file
    if [ -f temp ]; then
        rm temp
    fi
    sed '$d;/<<-CMD/,/CMD/d' $file > temp
    cat temp
    suffix=${file##*/}
    frameworkName=${suffix%.*}
    echo "  s.vendored_frameworks = 'Static/${frameworkName}.framework'" >> temp
    echo 'end' >> temp
    mv temp  ./CarthagePods/${suffix}
done
