//
//  TransactionOptionsTests.swift
//  GalileoTests
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import XCTest
@testable import Galileo

final class TransactionOptionsTests: XCTestCase {

	func testTransactionOptions_shouldBeAbleToEncode_whenUsingReadOnlyCase() {
		let readOnly = ReadOnly(readTime: "2014-10-02T15:01:23.045123456Z")
		let transaction = TransactionOptions.readOnly(readOnly)
		let encodedData = try! JSONEncoder().encode(transaction)
		
		let decodedTransaction = try! JSONDecoder().decode(TransactionOptions.self, from: encodedData)
		XCTAssertEqual(decodedTransaction, transaction)
	}
	
	func testTransactionOptions_shouldBeAbleToEncode_whenUsingReadWriteCase() {
		let readWrite = ReadWrite(retryTransaction: "123")
		let transaction = TransactionOptions.readWrite(readWrite)
		let encodedData = try! JSONEncoder().encode(transaction)

		let decodedTransaction = try! JSONDecoder().decode(TransactionOptions.self, from: encodedData)
		XCTAssertEqual(decodedTransaction, transaction)
	}

	func testTransactionOptions_shouldBeAbleToDecode_whenUsingReadWriteCase() {
		let jsonData = #"{"readWrite": { "retryTransaction": "123" } }"#.data(using: .utf8)!
		let decodedTransaction = try! JSONDecoder().decode(TransactionOptions.self, from: jsonData)
		
		let expectedTransactionOptions = TransactionOptions.readWrite(ReadWrite(retryTransaction: "123"))
		XCTAssertEqual(decodedTransaction, expectedTransactionOptions)
	}
	
	func testTransactionOptions_shouldBeAbleToDecode_whenUsingReadOnlyCase() {
		let jsonData = #"{"readOnly": { "readTime": "2014-10-02T15:01:23.045123456Z" } }"#.data(using: .utf8)!
		let decodedTransaction = try! JSONDecoder().decode(TransactionOptions.self, from: jsonData)

		let expectedTransactionOptions = TransactionOptions.readOnly(ReadOnly(readTime: "2014-10-02T15:01:23.045123456Z"))
		XCTAssertEqual(decodedTransaction, expectedTransactionOptions)
	}
}
