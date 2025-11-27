# AIService

AI Service SDK for iOS applications.

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.9+

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/AperoVN/AIService-Distribution", from: "1.0.0-alpha01")
]
```

Or in Xcode:
1. File → Add Package Dependencies...
2. Enter: `https://github.com/AperoVN/AIService-Distribution`
3. Select version `1.0.0-alpha01`

## Usage

```swift
import AIService

// Configure SDK
let config = AIServiceConfig(
    apiKey: "your-api-key",
    publicKey: "your-public-key",
    baseURL: URL(string: "https://api.example.com")!,
    appName: "YourApp",
    bundleId: Bundle.main.bundleIdentifier!,
    appVersion: "1.0.0"
)

try AIServiceSDK.shared.configure(config: config)

// Access services
let styleService = try AIServiceProvider.styleService()
let styles = try await styleService.getStyles()
```

## License

Proprietary - AperoVN
