## FB13094487 - Swift Package Manager fails to resolve dependency with different name than url

Swift Package Manager fails to resolve a dependency that has a different package name than its url suggests:

.package(url: "https://github.com/simonnickel/snl-core-swiftui", branch: "main"),

The url is /snl-core-swiftui, while the package name is SNLCoreSwiftUI.

It fails with the following error:
x-xcode-log://F414219F-DBD0-4A2A-AC10-E043451FEA5A product 'SNLCoreSwiftUI' required by package 'snl-theme' target 'SNLTheme' not found.



Using the deprecated dependency definition works: 
.package(name: "SNLCoreSwiftUI", url: "https://github.com/simonnickel/snl-core-swiftui", branch: "main")

As this is deprecated, it always shows a warning.



Full Package Definition:

import PackageDescription

let package = Package(
    name: "SNLTheme",
    products: [
        .library(
            name: "SNLTheme",
            targets: ["SNLTheme"]),
    ],
	dependencies: [
		// Does work, but deprecated:
		// .package(name: "FB13094487PackageProductNotFound", url: "https://github.com/simonnickel/FB13094487-package-product-not-found.git", branch: "main"),
		// Does not work:
		.package(url: "https://github.com/simonnickel/FB13094487-package-product-not-found.git", branch: "main")
	],
    targets: [
        .target(
            name: "SNLTheme",
			dependencies: ["FB13094487PackageProductNotFound"]), // <- Causes it to fail.
        .testTarget(
            name: "SNLThemeTests",
            dependencies: ["SNLTheme"]),
    ]
)
