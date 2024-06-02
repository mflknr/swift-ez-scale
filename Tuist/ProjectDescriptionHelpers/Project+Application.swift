import ProjectDescription

extension Project {
    static func makeApplicationTargets() -> [Target] {
        let appName = Constants.appName
        let mainTarget: Target = .target(
            name: appName,
            destinations: .iOS,
            product: .app,
            productName: appName,
            bundleId: "\(Constants.bundleIdPrefix)Application",
            deploymentTargets: Constants.deploymentTargets,
            infoPlist: .default,
            sources: ["\(Constants.sourcesDir)/Application/Sources/**"],
            resources: [
                "\(Constants.sourcesDir)/Application/Resources/**"
            ],
            scripts: [makeSwiftLintScriptPhase()],
            mergedBinaryType: .automatic
        )

        let unitTestTarget: Target = .target(
            name: "\(appName)Tests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "\(Constants.bundleIdPrefix)ApplicationTests",
            deploymentTargets: Constants.deploymentTargets,
            infoPlist: .default,
            sources: ["\(Constants.sourcesDir)/Application/Tests/**"],
            dependencies: []
        )

        return [mainTarget, unitTestTarget]
    }
}

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
}
