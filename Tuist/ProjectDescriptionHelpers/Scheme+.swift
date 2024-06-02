import ProjectDescription

extension Scheme {
    static func makeApplicationSchemes() -> [Scheme] {
        [
            .scheme(
                name: "Debug",
                buildAction: makeBuildAppAction(),
                testAction: makeTestAction(),
                runAction: makeDebugRunAction()
            ),
            .scheme(
                name: "Release",
                buildAction: makeBuildAppAction(),
                testAction: makeTestAction(),
                runAction: makeDistributableRunAction(),
                archiveAction: makeDistributableArchiveAction()
            )
        ]
    }

    // MARK: - Build

    private static func makeBuildAppAction() -> BuildAction {
        .buildAction(targets: ["\(Constants.appName)"])
    }

    // MARK: - Test

    private static func makeTestAction() -> TestAction {
        .targets(
            [
                .testableTarget(
                    target: "\(Constants.appName)Tests",
                    isSkipped: false,
                    isParallelizable: true,
                    isRandomExecutionOrdering: true
                )
            ] + makeTestableTargets(),
            arguments: .arguments(launchArguments: []),
            configuration: .debug,
            attachDebugger: true,
            expandVariableFromTarget: nil,
            preActions: [],
            postActions: [],
            options: .options(coverage: true),
            diagnosticsOptions: .options(
                addressSanitizerEnabled: false,
                detectStackUseAfterReturnEnabled: false,
                threadSanitizerEnabled: false,
                mainThreadCheckerEnabled: true,
                performanceAntipatternCheckerEnabled: false
            )
        )
    }

    private static func makeTestableTargets() -> [TestableTarget] {
        []
    }

    // MARK: - Run

    private static func makeDebugRunAction() -> RunAction {
        .runAction(
            configuration: .debug,
            attachDebugger: true,
            executable: "\(Constants.appName)",
            arguments: .arguments(
                launchArguments: [
                ]
            )

        )
    }

    private static func makeDistributableRunAction() -> RunAction {
        .runAction(
            configuration: .release,
            attachDebugger: false,
            executable: "\(Constants.appName)"
        )
    }

    // MARK: - Archive

    private static func makeDistributableArchiveAction() -> ArchiveAction {
        .archiveAction(
            configuration: .release,
            revealArchiveInOrganizer: false,
            customArchiveName: "\(Constants.appName)-Release"
        )
    }
}
