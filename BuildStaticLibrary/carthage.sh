#!/bin/bash
set -euo pipefail

echo "用法：
1.本脚本后面无参数，直接默认：
carthage update --platform iOS --no-use-binaries --cache-builds
2.有参数 -I | -Init
carthage build --platform iOS --no-use-binaries --cache-builds
3.除2以为有参数则等同于carthage命令"

#First Init
FIRST_INIT="false"

#DEFAULT RUN
DEFAULT_RUN="true"

if [ ! $# -eq 0 ]; then
    DEFAULT_RUN="false"
fi

while [ ! $# -eq 0 ]; do
    case "$1" in
        -I | -Init)
            FIRST_INIT="true";;
        *)
    esac
    shift
done

# Make a unique temporary file with mktemp
XCCONFIG=$(mktemp /tmp/static.xcconfig.XXXXXX)

# Perform clean-up on Interrupt, Hang Up, Terminate, Exit signals
trap 'rm -f "$XCCONFIG"' INT TERM HUP EXIT

# Base framework search path
#FMWK_SEARCH_PATHS="\$(inherited) ./Carthage/Build/iOS/**"

# For Xcode 12 make sure EXCLUDED_ARCHS is set to arm architectures otherwise
# the build will fail on lipo due to duplicate architectures.
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200 = arm64 arm64e armv7 armv7s' >> $XCCONFIG
echo 'EXCLUDED_ARCHS = $(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))' >> $XCCONFIG

# Write properties to the temp xconfig file
echo "MACH_O_TYPE = staticlib" >> $XCCONFIG
echo "DEBUG_INFORMATION_FORMAT = dwarf" >> $XCCONFIG

# Echo outcome
echo
echo "Building static frameworks with Xcode temporary xconfig file:"
echo $XCCONFIG
echo
echo "With contents:"
while read line; do
echo "$line"
done < $XCCONFIG

export XCODE_XCCONFIG_FILE="$XCCONFIG"

if [ $DEFAULT_RUN  == "true" ];then
    echo "carthage update --platform iOS --no-use-binaries --cache-builds"
    carthage update --platform iOS --no-use-binaries --cache-builds
elif [ $FIRST_INIT == "true" ]; then
    echo "carthage build --platform iOS --no-use-binaries --cache-builds"
    carthage build --platform iOS --no-use-binaries --cache-builds
else
    carthage "$@"
fi

cp Cartfile.resolved MainCartfile.resolved

if [ ! -f "CarthagePods/Static" ];then
    rm -rf CarthagePods/Static
fi
cp -rf Carthage/Build/iOS/Static CarthagePods
