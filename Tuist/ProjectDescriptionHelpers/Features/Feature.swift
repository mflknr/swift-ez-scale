struct Feature {
	let name: String
	let layers: [Layer]

	static func feature(name: String, layers: [Layer]) -> Feature {
		Feature(name: name, layers: layers)
	}

	var presentationTargetName: String {
		"\(name)\(LayerType.presentation.groupNamePostfix)"
	}

	var domainTargetName: String {
		"\(name)\(LayerType.domain.groupNamePostfix)"
	}

	var dataTargetName: String {
		"\(name)\(LayerType.data.groupNamePostfix)"
	}

	static var allFeatures: [Feature] {
		.allFeatures
	}
}

extension Sequence where Element == Feature {
	static var allFeatures: [Feature] {
		[
			.diagram
		]
	}
}

extension Sequence where Element == Layer {
	var hasPresentation: Bool {
		contains(where: { $0.type == .presentation })
	}

	var hasDomain: Bool {
		contains(where: { $0.type == .presentation })
	}

	var hasData: Bool {
		contains(where: { $0.type == .presentation })
	}
}

