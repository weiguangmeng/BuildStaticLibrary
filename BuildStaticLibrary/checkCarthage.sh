set -euxo pipefail

if ! which carthage 2>/dev/null; then
    echo "carthage not install"
    brew install carthage
fi

if [ ! -d "${SRCROOT}/Carthage/Checkouts/" ];then
    echo "${SRCROOT}/Carthage/Checkouts/ not exist"
    ${SRCROOT}/carthage.sh
elif [ ! -d "${SRCROOT}/Carthage/Build/" ];then
    echo "${SRCROOT}/Carthage/Build/ not exist"
    ${SRCROOT}/carthage.sh -I
else
    echo "Carthage/Build/文件夹已经存在"
fi

#更新
if [ ! -f "${SRCROOT}/MainCartfile.resolved" ];then
    echo "${SRCROOT}/MainCartfile.resolved not exist"
    ${SRCROOT}/carthage.sh -I
else
    comm -23 "${SRCROOT}/Cartfile.resolved" "${SRCROOT}/MainCartfile.resolved" > CartfileDiff
    if [ -s "CartfileDiff" ] ; then
        echo "carthage need update!"
        ${SRCROOT}/carthage.sh
    fi
    rm CartfileDiff
fi



