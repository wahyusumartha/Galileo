//
//  ReadWriteTests.swift
//  GalileoTests
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import XCTest
@testable import Galileo

final class ReadWriteTests: XCTestCase {

	func testReadWrite_shouldBeAbleToEncode() {
		let base64EncodedString = "hello".data(using: .utf8)!.base64EncodedString()
		let readWrite = ReadWrite(retryTransaction: base64EncodedString)
		let encodedData = try! JSONEncoder().encode(readWrite)
		
		let decodedReadWrite = try! JSONDecoder().decode(ReadWrite.self, from: encodedData)
		XCTAssertEqual(decodedReadWrite, readWrite)
	}
	
	func testReadWrite_shouldBeAbleToDecode() {
		let base64EncodedString = "hello".data(using: .utf8)!.base64EncodedString()
		let jsonData = #"{"retryTransaction": "\#(base64EncodedString)"}"#.data(using: .utf8)!
		let readWrite = try! JSONDecoder().decode(ReadWrite.self, from: jsonData)
		
		XCTAssertEqual(readWrite.retryTransaction, base64EncodedString)
	}
}
