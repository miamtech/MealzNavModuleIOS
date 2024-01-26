// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MealzNavModuleIOS",
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
        .package(path: "../MealzUIModuleIOS"),
        .package(path: "../miam-sdk"),
//        .package(url: "https://github.com/miamtech/MiamIOSFramework.git", from: "4.0.0"),
//        .package(url: "https://github.com/miamtech/MealzUIModuleIOS.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MealzNavModuleIOS",
            dependencies: [
                .product(name: "MiamIOSFramework", package: "miam-sdk"),
                .product(name: "MealzUIModuleIOS", package: "MealzUIModuleIOS")
            ])
    ]
)
