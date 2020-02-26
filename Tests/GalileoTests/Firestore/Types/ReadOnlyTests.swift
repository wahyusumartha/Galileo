//
//  ReadOnlyTests.swift
//  GalileoTests
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import XCTest
@testable import Galileo

final class ReadOnlyTests: XCTestCase {

	func testReadOnly_shouldBeAbleToEncode() {
		let readOnly = ReadOnly(readTime: "2014-10-02T15:01:23.045123456Z")
		let encodedData = try! JSONEncoder().encode(readOnly)
		
		let decodedReadOnly = try! JSONDecoder().decode(ReadOnly.self, from: encodedData)
		XCTAssertEqual(decodedReadOnly, readOnly)
	}
	
	func testReadOnly_shouldBeAbleToDecode() {
		let jsonData = #"{"readTime": "2014-10-02T15:01:23.045123456Z"}"#.data(using: .utf8)
		let decodedReadOnly = try! JSONDecoder().decode(ReadOnly.self, from: jsonData!)
		
		XCTAssertEqual(decodedReadOnly.readTime, "2014-10-02T15:01:23.045123456Z")
	}
}
