import ProjectDescription

public enum Constants {
    public static let projectName = "EasyScale"
    public static let appName = "EasyScale"
    public static let bundleId = "de.mflknr.EzScale"
    public static let bundleIdPrefix = "de.mflknr."

    public static let version = "2024.1.0"
    public static let swiftVersion = "5.9.0"

    // dir convention
    public static let projectDirPrefix = "Sources"
    public static let sourcesDir = "Sources"
    public static let resourcesDir = "Resources"
    public static let testsDirPrefix = "Tests"
    public static let uiTestsDir = "UITests"
    public static let featuresDir = "Features"
    public static let configurationsDir = ".configurations/.xcconfig/"

    // deployment target
    public static let minDeploymentTarget = "17.0"
    public static let deploymentTargets: DeploymentTargets = .iOS(minDeploymentTarget)
}
