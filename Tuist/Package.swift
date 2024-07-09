// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
	import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [
			ExternalDependency.inject.rawValue: .framework
		]
    )
#endif

let package = Package(
    name: "EasyScale",
    dependencies: [
        .package(url: "https://github.com/krzysztofzablocki/Inject.git", exact: "1.5.2"),
    ]
)
