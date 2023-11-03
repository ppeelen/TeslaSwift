// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TeslaSwift",
    platforms: [
        .macOS(.v11), .iOS(.v14), .watchOS(.v7), .tvOS(.v14)
    ],
    products: [
        .library(name: "TeslaSwift", targets: ["TeslaSwift"]),
        .library(name: "TeslaSwiftStreaming", targets: ["TeslaSwiftStreaming"]),
        .library(name: "TeslaSwiftCombine", targets: ["TeslaSwiftCombine"]),
        .library(name: "TeslaSwiftStreamingCombine", targets: ["TeslaSwiftStreamingCombine"])
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.6"),
        //.package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", Package.Dependency.Requirement.branch("feature/spm-support"))
    ],
    targets: [
        .target(name: "TeslaSwift"),
        .target(name: "TeslaSwiftStreaming", dependencies: ["TeslaSwift", "Starscream"], path: "Sources/Extensions/Streaming"),
        .target(name: "TeslaSwiftCombine", dependencies: ["TeslaSwift"], path: "Sources/Extensions/Combine"),
        .target(name: "TeslaSwiftStreamingCombine", dependencies: ["TeslaSwiftStreaming", "TeslaSwiftCombine"], path: "Sources/Extensions/StreamingCombine"),
        //.testTarget(name: "TeslaSwiftTests", dependencies: ["TeslaSwiftPMK", "PromiseKit", "OHHTTPStubsSwift"], path: "TeslaSwiftTests")
    ]
)
