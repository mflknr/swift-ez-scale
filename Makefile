CONFIG = debug

prepare:
	tuist install && tuist generate -n

build:
	tuist build Debug --clean --no-binary-cache

local-lint-swiftlint:
	~/.local/bin/mise x swiftlint@latest -- swiftlint Sources/ --config .swiftlint.yml

local-lint-swiftformat:
	~/.local/bin/mise x swiftformat@latest -- swiftformat Sources/ --lint --lenient

test:
	tuist test

format:
	mise x swiftformat@latest -- swiftformat Sources/

ci-lint-swiftlint:
	mise x swiftlint@latest -- swiftlint lint Sources/ --config .swiftlint.yml --strict

ci-lint-swiftformat:
	mise x swiftformat@latest -- swiftformat Sources/ --lint --strict
