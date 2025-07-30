#!/bin/bash

set -e

metadata=$1
shift
build_gradle_kts=$1
shift

version=$(grep version: ${metadata} | sed -e 's/^\s*version: "v\(.*\)"$/\1/')
kotlin_version=$(grep '"Require-Kotlin-Version" to' ${build_gradle_kts} | sed -e 's/^\s*"Require-Kotlin-Version" to "\(.*\)",$/\1/')

echo "Manifest-Version: 1.0"
echo "Implementation-Version: ${version}"
echo "Require-Kotlin-Version: ${kotlin_version}"
echo
