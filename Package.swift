// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
    dependencies: [
//          .package(path: "../MealzUIModuleIOS"),
//          .package(path: "../miam-sdk"),
       .package(url: "https://github.com/miamtech/MealzUIModuleIOS", from: "1.0.2"),
       .package(url: "https://gitlab.com/miam/kmm-miam-sdk.git", from: "4.0.3"),
      // .package(url: "https://github.com/miamtech/MealzUIModuleIOS", branch: "main"),
//        .package(url: "https://github.com/miamtech/miam-sdk.git", branch: "version-4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MealzNavModuleIOS",
            dependencies: [
                .product(name: "MealzUIModuleIOS", package: "MealzUIModuleIOS"),
              .product(name: "MiamIOSFramework", package: "kmm-miam-sdk")
                 // .product(name: "MiamIOSFramework", package: "miam-sdk")
            ],
            resources: [.copy("PrivacyInfo.xcprivacy")]
        )
    ]
)
