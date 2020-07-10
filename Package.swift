// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "DropDownMenuKit",
    // platforms: [.iOS("9.0")],
    products: [
        .library(name: "DropDownMenuKit", targets: ["DropDownMenuKit"])
    ],
    targets: [
        .target(
            name: "DropDownMenuKit",
            path: ""
        )
    ]
)
