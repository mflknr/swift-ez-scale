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
			dependencies: makeApplicationDependencies(),
            mergedBinaryType: .automatic
        )

        let unitTestTarget: Target = .target(
            name: "\(appName)Tests",
            destinations: Constants.destinations,
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

	private static func makeApplicationDependencies() -> [TargetDependency] {
		var dependencies = [TargetDependency]()

		var features: [Feature] = .allFeatures
		dependencies += features
			.map { toTargetDependencies($0) }
			.flatMap { $0 }

		return dependencies
	}

	private static func toTargetDependencies(_ feature: Feature) -> [TargetDependency] {
		var dependencies: [TargetDependency] = []

		for layer in feature.layers {
			switch layer.type {
			case .presentation:
				dependencies.append(TargetDependency.target(name: feature.presentationTargetName))
			case .domain:
				dependencies.append(TargetDependency.target(name: feature.domainTargetName))
			case .data:
				dependencies.append(TargetDependency.target(name: feature.dataTargetName))
			}
		}

		return dependencies
	}
}
