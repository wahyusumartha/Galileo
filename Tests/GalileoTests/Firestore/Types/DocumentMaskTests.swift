//
//  DocumentMaskTests.swift
//  GalileoTests
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import XCTest
@testable import Galileo

final class DocumentMaskTests: XCTestCase {
	func testDocumentMask_shouldAssignFieldPathsProperty() {
		let fieldPaths = ["Hello", "World"]
		let documentMask = DocumentMask(fieldPaths: fieldPaths)
		
		XCTAssertEqual(documentMask.fieldPaths, fieldPaths)
	}
	
	func testDocumentMask_shouldBeAbleToEncode() {
		let documentMask = DocumentMask(fieldPaths: ["Hello", "World"])
		let encodedData = try! JSONEncoder().encode(documentMask)
		
		let decodedDocumentMask = try! JSONDecoder().decode(DocumentMask.self, from: encodedData)
		
		XCTAssertEqual(decodedDocumentMask, documentMask)
	}
	
	func testDocumentMask_shouldBeAbleToDecode() {
		let json = #"{"fieldPaths": ["Hello", "World"]}"#
		let jsonData = json.data(using: .utf8)!
		let documentMask = try! JSONDecoder().decode(DocumentMask.self, from: jsonData)
		XCTAssertEqual(documentMask.fieldPaths, ["Hello", "World"])
	}
}
