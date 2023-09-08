# FB13094487 - Swift Package Manager fails to resolve dependency with different name than url


## Solution

Apple Engineering team kindle responded with a solution:

```
targets: [
	.target(
		name: "SNLTheme",
		dependencies: [
			// Solution: (instead of ["FB13094487PackageProductNotFound"])
			.product(name: "FB13094487PackageProductNotFound", package: "FB13094487-package-product-not-found")
		]), 
	.testTarget(
		name: "SNLThemeTests",
		dependencies: ["SNLTheme"]),
]
```

This does work and cleares the warning. However, I still think is a change for the worse compared to the previous API. The Package name should be declared where the package is defined.


## Issue

Swift Package Manager fails to resolve a dependency that has a different package name than its url suggests:

.package(url: "https://github.com/simonnickel/FB13094487-package-product-not-found.git", branch: "main"),

The url is /FB13094487-package-product-not-found.git, while the package name is FB13094487PackageProductNotFound.

It fails with the following error:
x-xcode-log://F414219F-DBD0-4A2A-AC10-E043451FEA5A product 'FB13094487PackageProductNotFound' required by package 'snl-theme' target 'SNLTheme' not found.



Using the deprecated dependency definition works: 
.package(name: "FB13094487PackageProductNotFound", url: "https://github.com/simonnickel/FB13094487-package-product-not-found.git", branch: "main")

As this is deprecated, it always shows a warning.



Full Package Definition:

import PackageDescription

```
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
```
