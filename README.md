# DifferenceRepresentable
Tiny library to detect differences between two instances.
For example, you can check whether the users edited their data at some kind of form views before send the changes to your server.
```swift
struct User: DifferenceRepresentable {
    let name: String
    let country: String
    let imageUrl: URL?
}

let userA = User(name: "Bob", country: "Japan", imageUrl: URL(string: "https://example.com"))
let userB = User(name: "Bob", country: "United States", imageUrl: nil)
var diff = userA.difference(from: userB)
diff.keys   // ["country", "imageUrl"]
diff.values // ["United States", URL(https://example.com)]
```
## Requirements
- Xcode 11.x / Swift 5.x
- iOS 8.0 or later
- macOS 10.9 or later
- tvOS 9.0 or later
- watchOS 2.0 or later

## Installation
This library can be installed via Swift Package Manager and CocoaPods.
### CocoaPods
Insert `pod 'DifferenceRepresentable'` to your Podfile and run `pod install`.

## License
This library is under the MIT License.

---
Keywords for SEO.
- Swift Object Difference Detection
- Swift 差分 検出
