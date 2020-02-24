import XCTest
@testable import Galileo

final class GalileoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Galileo().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
