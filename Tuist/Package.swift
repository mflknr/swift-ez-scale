// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [:]
    )
#endif

let package = Package(
    name: "EasyScale",
    dependencies: [
        .package(url: "https://github.com/jessesquires/Foil.git", exact: "5.0.0"),
        .package(url: "https://github.com/krzysztofzablocki/Inject.git", exact: "1.5.1"),
    ]
)
