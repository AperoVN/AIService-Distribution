# AIService

AI Service SDK for iOS applications - Swift Package Manager Distribution.

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2015.0+-blue.svg)](https://developer.apple.com/ios/)
[![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)

## Overview

AIService SDK provides a protocol-oriented networking layer for AI video generation services. Built with Swift, it uses RSA signature authentication and modern async/await concurrency.

> **Note:** This is the distribution repository for SPM. The source code is maintained in a separate private repository.

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.9+

## Installation

### Swift Package Manager (Recommended)

#### Using Xcode

1. Open your project in Xcode
2. Go to **File → Add Package Dependencies...**
3. Enter the repository URL:
   ```
   https://github.com/AperoVN/AIService-Distribution
   ```
4. Select version rule: **Exact Version** → `1.0.0-alpha02`
5. Click **Add Package**

#### Using Package.swift

Add the following to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/AperoVN/AIService-Distribution", exact: "1.0.0-alpha02")
]
```

Then add `AIService` to your target dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["AIService"]
    )
]
```

## Quick Start

### 1. Import the SDK

```swift
import AIService
```

### 2. Configure the SDK

```swift
// Create configuration
let config = AIServiceConfig(
    apiKey: "your-api-key",
    publicKey: "your-public-key",
    baseURL: URL(string: "https://api.example.com")!,
    appName: "YourApp",
    bundleId: Bundle.main.bundleIdentifier!,
    appVersion: "1.0.0"
)

// Configure SDK (call once at app launch)
do {
    try AIServiceSDK.shared.configure(config: config)
} catch {
    print("Failed to configure AIService: \(error)")
}
```

### 3. Access Services

```swift
// Get style service
let styleService = try AIServiceProvider.styleService()
let styles = try await styleService.getStyles()

// Get video service
let videoService = try AIServiceProvider.videoService()
let history = try await videoService.getVideoHistory(page: 1, limit: 10)

// Get user service
let userService = try AIServiceProvider.userService()
let profile = try await userService.getProfile()

// Get video generate service
let generateService = try AIServiceProvider.videoGenerateService()
let response = try await generateService.generateVideo(request: request)
```

## Available Services

| Service | Protocol | Description |
|---------|----------|-------------|
| Style | `AIStyleServiceProtocol` | Manage AI styles and categories |
| Video | `AIVideoServiceProtocol` | Video history and management |
| User | `AIUserServiceProtocol` | User profile and credits |
| VideoGenerate | `AIVideoGenerateServiceProtocol` | AI video generation |

## Error Handling

All services return `ResponseState<T>` which can be handled using pattern matching:

```swift
let result = try await styleService.getStyles()

switch result {
case .success(let styles):
    print("Got \(styles.count) styles")
case .error(let code, let message, let errorCode):
    print("Error \(code): \(message ?? "Unknown")")
}
```

Or use the convenience methods:

```swift
// Unwrap or throw
let styles = try await styleService.getStyles().unwrap()

// Unwrap with default
let styles = try await styleService.getStyles().unwrap(default: [])
```

## Version History

| Version | Release Date | Notes |
|---------|--------------|-------|
| 1.0.0-alpha02 | 2025-11-27 | Pre-release for testing, iOS 15.0+ support |

## License

Proprietary - AperoVN. All rights reserved.

## Support

For issues and feature requests, please contact the development team.
