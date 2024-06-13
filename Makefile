CONFIG = debug
MISE = ~/.local/bin/mise

build:
	tuist build Debug --clean --no-binary-cache

test:
	tuist test

format:
	$(MISE) x swiftformat@latest -- swiftformat Sources/

lint-swiftlint:
	$(MISE) x swiftlint@latest -- swiftlint Sources/ --config .swiftlint.yml

lint-swiftformat:
	$(MISE) x swiftformat@latest -- swiftformat Sources/ --lint --lenient

lint-strict-swiftformat:
	$(MISE) x swiftformat@latest -- swiftformat Sources/ --lint --strict
