import ProjectDescription

extension Project {
    static func makeSettings() -> Settings {
        .settings(
            base: makeBaseSettings(),
            configurations: makeConfigurations(),
            defaultSettings: .recommended
        )
    }

    static func makeBaseSettings() -> SettingsDictionary {
        SettingsDictionary()
            .marketingVersion(Constants.version)
            .swiftVersion(Constants.swiftVersion)
    }
}
