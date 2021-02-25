#!/bin/bash

cd "$(dirname "$(dirname "$0")")" || exit 1

exec /usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$(pwd)/Source/Info.plist"
