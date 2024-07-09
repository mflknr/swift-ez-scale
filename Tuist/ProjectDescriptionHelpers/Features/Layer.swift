import ProjectDescription

struct Layer {
	let type: LayerType
	let isUiTestable: Bool
	let isUnitTestable: Bool
	let dependencies: [TargetDependency]

	static func layer(
		type: LayerType,
		isUiTestable: Bool = false,
		isUnitTestable: Bool = false,
		dependencies: [TargetDependency] = []
	) -> Layer {
		Layer(
			type: type,
			isUiTestable: isUiTestable,
			isUnitTestable: isUnitTestable,
			dependencies: dependencies
		)
	}
}

enum LayerType: CaseIterable {
	case presentation
	case domain
	case data

	var groupNamePostfix: String {
		switch self {
		case .presentation:
			return "Presentation"
		case .domain:
			return "Domain"
		case .data:
			return "Data"
		}
	}
}
