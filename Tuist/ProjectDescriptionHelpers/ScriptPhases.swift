import ProjectDescription

extension Project {

    // MARK: - Post

    static func makeSwiftLintScriptPhase() -> TargetScript {
        .post(
            script: """
               if [[ -z ${CI} ]] ; then
                   make lint-swiftlint
               else
                   echo "Skipping SwiftLint build phase on pipeline. Local build phase only."
                   exit 0
               fi
               """,
            name: "Run SwiftLint",
            basedOnDependencyAnalysis: false,
            runForInstallBuildsOnly: false
        )
    }

    static func makeSwiftFormatScriptPhase() -> TargetScript {
        .post(
            script: """
               if [[ -z ${CI} ]] ; then
                   make lint-swiftformat
               else
                   echo "Skipping SwiftFormat build phase on pipeline. Local build phase only."
                   exit 0
               fi
               """,
            name: "Run SwiftFormat",
            basedOnDependencyAnalysis: false,
            runForInstallBuildsOnly: false
        )
    }
}
