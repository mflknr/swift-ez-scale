import ProjectDescription

public enum Constants {
    public static let projectName = "EasyScale"
    public static let appName = "EasyScale"
    public static let bundleIdPrefix = "de.mflknr."
    public static let bundleId = "\(bundleIdPrefix)\(appName)"

    public static let version = "2024.1.0"
    public static let swiftVersion = "5.9.0"

    // dir convention
    public static let projectDirPrefix = "Sources"
    public static let sourcesDir = "Sources/"
    public static let resourcesDir = "Resources/"
    public static let testsDirPrefix = "Tests/"
    public static let uiTestsDir = "UITests/"
    public static let featuresDir = "\(sourcesDir)Features/"
    public static let configurationsDir = ".configurations/.xcconfig/"

    // deployment target
	public static let destinations: Destinations = .iOS
    public static let iOSMinDeploymentTarget = "17.0"
    public static let watchOSMinDeploymentTarget = "10.0"
    public static let deploymentTargets: DeploymentTargets = .multiplatform(
        iOS: iOSMinDeploymentTarget
    )
}
