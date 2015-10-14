PROJECT = Dynamics.xcodeproj
SCHEME = Dynamics
CONFIGURATION = Debug
SDK = iphonesimulator
DESTINATION_IPHONE = 'name=iPhone 6s'
DESTINATION_IPHONE_PLUS = 'name=iPhone 6s Plus'
DESTINATION_IPAD = 'name=iPad Air 2'

.PHONY: all test clean

all: test

test:
	set -o pipefail && xcodebuild \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-configuration $(CONFIGURATION) \
	-sdk $(SDK) \
	-destination $(DESTINATION_IPHONE) \
	-destination $(DESTINATION_IPHONE_PLUS) \
	-destination $(DESTINATION_IPAD) \
	 test | xcpretty -c

clean:
	xcodebuild \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-configuration $(CONFIGURATION) \
	-sdk $(SDK) \
	-destination $(DESTINATION_IPHONE) \
	-destination $(DESTINATION_IPHONE_PLUS) \
	-destination $(DESTINATION_IPAD) \
	 clean
