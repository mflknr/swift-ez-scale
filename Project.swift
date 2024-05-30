import ProjectDescription

enum Constants {
    static let projectName = "EzScale"
    static let bundleId = "de.mflknr.EzScale"
    static let bundleIdPrefix = "de.mflknr."

    static let sourcesRoot = "Sources/"
}

let project = Project(
    name: Constants.projectName,
    targets: [
        .target(
            name: "Application",
            destinations: .iOS,
            product: .app,
            bundleId: "\(Constants.bundleIdPrefix)Application",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["\(Constants.sourcesRoot)Application/Sources/**"],
            resources: ["\(Constants.sourcesRoot)Application/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "ApplicationTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "\(Constants.bundleIdPrefix)ApplicationTests",
            infoPlist: .default,
            sources: ["\(Constants.sourcesRoot)Application/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "Application")
            ]
        ),
    ]
)
