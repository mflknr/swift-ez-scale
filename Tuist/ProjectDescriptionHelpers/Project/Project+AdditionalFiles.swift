import ProjectDescription

extension Project {
    static func makeAdditionalFiles() -> [FileElement] {
        [
            ".swiftlint.yml",
            ".swiftformat",
            ".periphery.yml",
            ".mise.toml",
            "Makefile",
            "Tuist/FileHeaderTemplate",
            ".git/hooks/pre-commit.sh",
            ".gitignore",
            "\(Constants.configurationsDir)Shared.xcconfig",
            ".github/workflows/*",
            ".github/dependabot.yml",
			"README.md",
			"LICENSE"
        ]
    }
}
