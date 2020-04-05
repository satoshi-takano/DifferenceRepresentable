import XCTest
@testable import DifferenceRepresentable

struct User: DifferenceRepresentable {
    let name: String
    let age: Int
    let country: String
    let imageUrl: URL?
}

final class DifferenceRepresentableTests: XCTestCase {
    func testExample() {
        let userA = User(name: "Bob", age: 10, country: "Japan", imageUrl: URL(string: "https://example.com"))
        let userB = User(name: "Bob", age: 20, country: "United State", imageUrl: nil)
        var diff = userA.difference(from: userB)
        XCTAssertEqual(diff.keys.count, 3)
        XCTAssertEqual(diff["age"], 10)
        XCTAssertEqual(diff["country"], "Japan")
        XCTAssertEqual(diff["imageUrl"] as? URL, URL(string: "https://example.com"))

        diff = userB.difference(from: userA)
        XCTAssertEqual(diff.keys.count, 3)
        XCTAssertEqual(diff["age"], 20)
        XCTAssertEqual(diff["country"], "United State")
        XCTAssertNil(diff["imageUrl"])
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
