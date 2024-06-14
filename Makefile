CONFIG = debug

encode-configs:
	base64 -i .configurations/.xcconfig/Debug.xcconfig -o .configurations/.xcconfig/Debug.xcconfig.base64; \
	base64 -i .configurations/.xcconfig/Shared.xcconfig -o .configurations/.xcconfig/Shared.xcconfig.base64; \
	base64 -i .configurations/.xcconfig/Release.xcconfig -o .configurations/.xcconfig/Release.xcconfig.base64

prepare:
	tuist install && tuist generate -n

build:
	tuist build Debug --clean --no-binary-cache

local-lint-swiftlint:
	~/.local/bin/mise x swiftlint@latest -- swiftlint Sources/ --config .swiftlint.yml

local-lint-swiftformat:
	~/.local/bin/mise x swiftformat@latest -- swiftformat Sources/ --lint --lenient

test:
	tuist test --configuration "Debug" --device "iPhone 15 Pro" --os "17.2.0" "Debug"

format:
	mise x swiftformat@latest -- swiftformat Sources/

ci-lint-swiftlint:
	mise x swiftlint@latest -- swiftlint lint Sources/ --config .swiftlint.yml --strict

ci-lint-swiftformat:
	mise x swiftformat@latest -- swiftformat Sources/ --lint --strict
