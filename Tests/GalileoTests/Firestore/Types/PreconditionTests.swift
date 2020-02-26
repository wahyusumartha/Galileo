//
//  PreconditionTests.swift
//  GalileoTests
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import XCTest
@testable import Galileo

final class PreconditionTests: XCTestCase {

	func testPrecondition_shouldBeAbleToBeEncode_whenCaseIsExists() {
		let precondition = Precondition.exists(true)
		let encodedData = try! JSONEncoder().encode(precondition)
		
		let decodedPrecondition = try! JSONDecoder().decode(Precondition.self, from: encodedData)
		XCTAssertEqual(decodedPrecondition, precondition)
	}
	
	func testPrecondition_shouldBeAbleToEncode_whenCaseIsUpdateTime() {
		let precondition = Precondition.updateTime("123")
		let encodedData = try! JSONEncoder().encode(precondition)
		
		let decodedPrecondition = try! JSONDecoder().decode(Precondition.self, from: encodedData)
		XCTAssertEqual(decodedPrecondition, precondition)
	}
	
	func testPrecondition_shouldBeAbleToBeDecode_whenCaseIsExists() {
		let json = #"{"exists": true}"#
		let jsonData = json.data(using: .utf8)!
		
		let precondition = try! JSONDecoder().decode(Precondition.self, from: jsonData)
		let expectedPrecondition = Precondition.exists(true)
		XCTAssertEqual(precondition, expectedPrecondition)
	}
	
	func testPrecondition_shouldBeAbleToDecode_whenCaseIsUpdateTime() {
		let json = #"{"updateTime": "1234"}"#
		let jsonData = json.data(using: .utf8)!
		
		let precondition = try! JSONDecoder().decode(Precondition.self, from: jsonData)
		let expectedPrecondition = Precondition.updateTime("1234")
		XCTAssertEqual(precondition, expectedPrecondition)
	}
}
