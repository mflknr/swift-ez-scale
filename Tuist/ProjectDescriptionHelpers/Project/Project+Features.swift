import ProjectDescription

extension Project {
	static func makeFeatureTargets() -> [Target] {
		let features: [Feature] = .allFeatures

		let targets = features
			.map { toTargets($0) }
			.flatMap { $0 }

		return targets
	}

	private static func toTargets(_ feature: Feature) -> [Target] {
		var targets: [Target] = []

		for layer in feature.layers {
			let layerFeaturePath = "\(Constants.featuresDir)\(feature.name)/\(layer.type.groupNamePostfix)/"

			let sourceTargetName = "\(feature.name)\(layer.type.groupNamePostfix)"
			let sourceBundleId = "\(Constants.bundleIdPrefix)\(sourceTargetName)"

			var sourceDependencies = layer.dependencies
			switch layer.type {
			case .presentation:
				// add domain layer as dependency if present
				if feature.layers.hasDomain {
					sourceDependencies += [
						.target(name: feature.domainTargetName)
					]
				}

				// add default dependencies
				sourceDependencies += [
					.external(dependency: .inject)
				]
			case .domain:
				sourceDependencies += []
			case .data:
				if feature.layers.hasDomain {
					sourceDependencies += [
						.target(name: feature.domainTargetName)
					]
				}
			}

			// MARK: source target

			let sourceTarget: Target = .target(
				name: sourceTargetName,
				destinations: Constants.destinations,
				product: .framework, // TODO: check if product is most efficient
				bundleId: sourceBundleId,
				deploymentTargets: Constants.deploymentTargets,
				sources: [
					"\(layerFeaturePath)/Sources/**/*"
				],
				dependencies: sourceDependencies,
				mergedBinaryType: .automatic, // TODO: check
				mergeable: true // TODO: check
			)

			targets.append(sourceTarget)

			// MARK: uitest target

			if layer.isUiTestable {
				let uiTestTarget: Target = .target(
					name: "\(sourceTargetName)UITests",
					destinations: Constants.destinations,
					product: .uiTests,
					bundleId: "\(sourceBundleId)UITests",
					sources: [
						"\(layerFeaturePath)UITests/**"
					],
					dependencies: [
						.target(name: sourceTargetName)
					],
					mergedBinaryType: .automatic
				)

				targets.append(uiTestTarget)
			}

			// MARK: unittest target

			if layer.isUnitTestable {
				let unitTestTarget: Target = .target(
					name: "\(sourceTargetName)Tests",
					destinations: Constants.destinations,
					product: .unitTests,
					bundleId: "\(sourceBundleId)Tests",
					sources: [
						"\(layerFeaturePath)Tests/**"
					],
					dependencies: [
						.target(name: sourceTargetName)
					],
					mergedBinaryType: .automatic
				)

				targets.append(unitTestTarget)
			}
		}

		return targets
	}
}
