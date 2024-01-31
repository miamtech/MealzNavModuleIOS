Pod::Spec.new do |spec|
    spec.name         = 'MealzNavModuleIOS'
    spec.version      = '1.0.0-beta1'
    spec.summary      = 'Mealz UI iOS SDK'
    spec.description  = <<-DESC
        Mealz UI iOS SDK.
        DESC

    spec.homepage     = 'https://www.miam.tech'
    spec.license      = "GPLv3"
    spec.author             = { "Diarmuid McGonagle" => "it@miam.tech" }
    spec.platform     = :ios, "12.0"
    spec.swift_version = '5.8'
    spec.source       = { :git => "https://github.com/miamtech/MealzNavModuleIOS.git", :tag => "#{spec.version}" }
    spec.source_files = 'Sources/**/*.{h,m,swift}'
    spec.dependency 'MealzUIModuleIOS', '~> 1.0.0-beta2'
    spec.static_framework = true
end
