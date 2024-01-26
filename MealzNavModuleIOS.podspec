Pod::Spec.new do |spec|

  spec.name         = "MealzNavModuleIOS"
  spec.version      = "1.0.0-beta"
  spec.summary      = "Mealz UI iOS SDK"
  spec.description  = <<-DESC
Mealz UI iOS SDK.
                   DESC

  spec.homepage     = "https://www.miam.tech"
  spec.license      = "GPLv3"
  spec.author             = { "Diarmuid McGonagle" => "it@miam.tech" }
  spec.platform     = :ios, "11.0"
  spec.swift_versions = "5.8"
  
  spec.source       = { :git => "https://github.com/miamtech/MealzNavModuleIOS.git", :tag => "#{spec.version}" }

 
   spec.source_files = 'Sources/**/*.{h,m,swift}'
   
spec.dependency 'MealzUIModuleIOS', '~> 1.0'

end