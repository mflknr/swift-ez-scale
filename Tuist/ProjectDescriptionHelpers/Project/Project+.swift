import ProjectDescription

public extension Project {
    static func make() -> Project {
        Project(
            name: Constants.projectName,
            options: .options(
                automaticSchemesOptions: .disabled,
                textSettings: .textSettings(
                    usesTabs: true,
                    indentWidth: 4,
                    tabWidth: 4
                )
            ),
            settings: makeSettings(),
            targets: makeProjectTargets(),
            schemes: Scheme.makeApplicationSchemes(),
            fileHeaderTemplate: .file("Tuist/FileHeaderTemplate"),
            additionalFiles: makeAdditionalFiles()
        )
    }

	private static func makeProjectTargets() -> [Target] {
		[
			makeApplicationTargets(),
			makeFeatureTargets()
		].flatMap { $0 }
	}
}
