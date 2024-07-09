import ProjectDescription

public enum ExternalDependency: String {
	case inject = "Inject"
}

extension TargetDependency {
	static func external(dependency: ExternalDependency) -> TargetDependency {
		.external(name: dependency.rawValue)
	}
}
