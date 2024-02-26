//
//  Bundle.Extension.swift
//
//
//  Created by miam x didi on 19/02/2024.
//

import Foundation

extension Bundle {
    static var mealzNavBundle: Bundle = {
        #if SWIFT_PACKAGE
        let bundleName = "MealzNavModuleIOS_MealzNavModuleIOS"
        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,
            // Bundle should be present here when the package is being run from the swift package's Tests.
            Bundle(for: BundleToken.self).resourceURL,
            // For command-line tools.
            Bundle.main.bundleURL,
        ]
        #else
        // When the module is being built with CocoaPods (or potentially other methods)
        let bundleName = "MealzNavModuleIOS"
        let candidates = [
            // CocoaPods typically places resources in the main bundle directly.
            Bundle.main.resourceURL,
        ]
        #endif

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("Unable to find bundle named \(bundleName)")
    }()
}

private class BundleToken {}
