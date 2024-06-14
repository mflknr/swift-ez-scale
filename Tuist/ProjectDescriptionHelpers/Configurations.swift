import ProjectDescription

extension Project {
    static func makeConfigurations() -> [Configuration] {
        [
            .debug(name: .debug, xcconfig: "\(Constants.configurationsDir)Debug.xcconfig"),
            .release(name: .release, xcconfig: "\(Constants.configurationsDir)Release.xcconfig")
        ]
    }
}

extension ConfigurationName {
    static let debug: ConfigurationName = "Debug"
    static let release: ConfigurationName = "Release"
}
