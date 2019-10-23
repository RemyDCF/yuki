import XCTest
@testable import Yuki

final class YukiTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Yuki().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
