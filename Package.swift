// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "InstanceHelper",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "InstanceHelperObjectiveC", targets: ["InstanceHelperObjectiveC"]),
        .library(name: "InstanceHelper", targets: ["InstanceHelper"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "InstanceHelperObjectiveC",
            path: "Source/Main",
            exclude: [
                "Swift",
            ],
            sources: [
                "ObjectiveC",
            ]
        ),
        .target(
            name: "InstanceHelper",
            dependencies: [
                "InstanceHelperObjectiveC"
            ],
            path: "Source/Main",
            exclude: [
                "ObjectiveC",
            ],
            sources: [
                "Swift",
            ],
            publicHeadersPath: "include",
            cSettings: [
                CSetting.headerSearchPath("ObjectiveC"),
            ]
        ),
    ]
)
