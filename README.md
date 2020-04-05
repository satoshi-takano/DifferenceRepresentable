# DifferenceRepresentable
Tiny library to detect differences between two instances.
For example, you can check whether the users edited their data at some kind of form views before send the changes to your server.
```swift
struct User: DifferenceRepresentable {
    let name: String
    let age: Int
    let country: String
    let imageUrl: URL?
}

let userA = User(name: "Bob", age: 10, country: "Japan", imageUrl: URL(string: "https://example.com"))
let userB = User(name: "Bob", age: 20, country: "United State", imageUrl: nil)
var diff = userA.difference(between: userB)
```
## Requirements
- Xcode 11.x / Swift 5.x
- iOS 8.0 or later
- macOS 10.9 or later
- tvOS 9.0 or later
- watchOS 2.0 or later

## Installation
This library can be installed via Swift Package Manager and CocoaPods
### CocoaPods
Insert `pod 'DifferenceRepresentable'` to your Podfile and run `pod install`.

## License
This library is under the MIT License.
