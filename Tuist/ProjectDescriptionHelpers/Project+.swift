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
            targets: makeApplicationTargets(),
            schemes: Scheme.makeApplicationSchemes(),
            fileHeaderTemplate: .file("Tuist/FileHeaderTemplate"),
            additionalFiles: [
                ".swiftlint.yml",
                ".swiftformat",
                ".mise.toml",
                "Makefile",
                "Tuist/FileHeaderTemplate",
                ".git/hooks/pre-commit.sh"
            ]
        )
    }
}
