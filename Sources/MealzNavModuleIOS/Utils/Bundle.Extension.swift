//
//  Bundle.Extension.swift
//
//
//  Created by miam x didi on 19/02/2024.
//

import Foundation

extension Bundle {
    static var mealzNavBundle: Bundle = {
        // Method to find the bundle for a class that is part of your Swift package
        let bundleName = "MealzNavModuleIOS_MealzNavModuleIOS"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,
            // Bundle should be present here when the package is being run from the swift package's Tests.
            Bundle(for: BundleToken.self).resourceURL,
            // For command-line tools.
            Bundle.main.bundleURL,
        ]
        
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
