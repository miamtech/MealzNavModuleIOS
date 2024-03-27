// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

//let configurationMode = ProcessInfo.processInfo.environment["CONFIGURATION_MODE"] ?? "prod"
let configurationMode = "prod"

let package = Package(
    name: "MealzNavModuleIOS",
    defaultLocalization: "fr",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MealzNavModuleIOS",
            targets: ["MealzNavModuleIOS"]),
    ],
    dependencies: {
        var dependencies: [Package.Dependency] = []
        
        if configurationMode == "dev" {
            dependencies.append(contentsOf: [
                .package(path: "../MealzUIModuleIOS"),
                .package(path: "../MealzCore"),
                .package(path: "../MealzIOSFramework")
            ]
            )
        } else if configurationMode == "devWithSPM" {
            dependencies.append(contentsOf: [
                .package(path: "../MealzUIModuleIOS"),
                .package(path: "../MealzCore"),
                .package(path: "../MealzIOSFrameworkSPM")
            ]
            )
        } else {
            dependencies.append(contentsOf: [
                .package(url: "https://github.com/miamtech/releaseMealz", from: "1.0.0-beta3"),
                .package(url: "https://github.com/miamtech/MealzIOSFrameworkSPM", exact: "1.0.0-beta3"),
                .package(url: "https://github.com/miamtech/MealzUIModuleIOS", from: "1.0.2-beta2")
            ]
            )
        }
        return dependencies
    }(),
    targets: [
        .target(
            name: "MealzNavModuleIOS",
            dependencies: {
                var dependencies: [Target.Dependency] = [.product(name: "MealzUIModuleIOS", package: "MealzUIModuleIOS")]
                if configurationMode == "dev" {
                    dependencies.append(contentsOf: [
                        .product(name: "MealzCore", package: "MealzCore"),
                        .product(name: "MealzIOSFramework", package: "MealzIOSFramework")
                    ]
                    )
                } else if configurationMode == "devWithSPM" {
                    dependencies.append(contentsOf: [
                        .product(name: "MealzCore", package: "MealzCore"),
                        .product(name: "MealzIOSFrameworkSPM", package: "MealzIOSFrameworkSPM")
                    ]
                    )
                } else {
                    dependencies.append(contentsOf: [
                        .product(name: "MealzCore", package: "releaseMealz"),
                        .product(name: "MealzIOSFrameworkSPM", package: "MealzIOSFrameworkSPM")
                    ]
                    )
                }
                return dependencies
            }(),
            resources: [.copy("PrivacyInfo.xcprivacy")]
        )
    ]
)
