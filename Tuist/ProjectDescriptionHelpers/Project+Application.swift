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
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": .dictionary(
                        [
                            "UILaunchScreen": .string("")
                        ]
                    )
                ]
            ),
            sources: [
                "\(Constants.sourcesDir)Application/Sources/**"
            ],
            resources: [
                "\(Constants.sourcesDir)Application/Resources/**"
            ],
            scripts: [
                makeSwiftLintScriptPhase(),
                makeSwiftFormatScriptPhase()
            ],
            mergedBinaryType: .automatic
        )

        let unitTestTarget: Target = .target(
            name: "\(appName)Tests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "\(Constants.bundleIdPrefix)ApplicationTests",
            deploymentTargets: Constants.deploymentTargets,
            infoPlist: .default,
            sources: ["\(Constants.sourcesDir)Application/Tests/**"],
            dependencies: []
        )

        return [
            mainTarget,
            unitTestTarget
        ]
    }
}
