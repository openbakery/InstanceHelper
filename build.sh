#!/bin/sh


NAME=InstanceHelper
PROJECT=$NAME.xcodeproj
SCHEME=$NAME
SIMULATOR_NAME="iPhone 16 Pro"

carthage bootstrap --platform iOS --use-xcframeworks --cache-builds

build() {

	xcodebuild build-for-testing -scheme $SCHEME -configuration Debug \
		-UseNewBuildSystem=YES \
		-derivedDataPath ./build -disable-concurrent-destination-testing \
		-destination platform="iOS Simulator,name=$SIMULATOR_NAME" \
		-parallel-testing-enabled NO \
		-enableAddressSanitizer NO -enableThreadSanitizer NO -enableUndefinedBehaviorSanitizer NO \
		-enableCodeCoverage NO COMPILER_INDEX_STORE_ENABLE=NO \
		-skipMacroValidation \
		ARCH=arm64 \
		CODE_SIGN_IDENTITY= \
		CODE_SIGNING_REQUIRED=NO \
		CODE_SIGNING_ALLOWED=NO | xcbeautify -qq --disable-colored-output
}


unitTest() {
	xcodebuild test-without-building -scheme $SCHEME -configuration Debug \
		-UseNewBuildSystem=YES \
		-derivedDataPath ./build -disable-concurrent-destination-testing \
		-destination platform="iOS Simulator,name=$SIMULATOR_NAME" \
		-parallel-testing-enabled NO \
		-enableAddressSanitizer NO -enableThreadSanitizer NO -enableUndefinedBehaviorSanitizer NO \
		-enableCodeCoverage NO COMPILER_INDEX_STORE_ENABLE=NO \
		-collect-test-diagnostics never \
		-skipMacroValidation \
		ARCH=arm64 \
		$ONLY_TEST | xcbeautify --disable-colored-output

}

build

if [ $? != 0 ]; then
  echo "Build failed"
  exit 1
fi

unitTest
