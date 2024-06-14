//
//  AdditionalFiles.swift
//  ProjectDescriptionHelpers
//
//  Created by Marius Felkner on 14.06.24.
//

import ProjectDescription

extension Project {
    static func makeAdditionalFiles() -> [FileElement] {
        [
            ".swiftlint.yml",
            ".swiftformat",
            ".mise.toml",
            "Makefile",
            "Tuist/FileHeaderTemplate",
            ".git/hooks/pre-commit.sh",
            ".gitignore",
            "\(Constants.configurationsDir)Shared.xcconfig",
            ".github/workflows/*"
        ]
    }
}
