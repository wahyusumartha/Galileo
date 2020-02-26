//
//  DocumentResponseTests.swift
//  GalileoTests
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import XCTest
@testable import Galileo
@testable import AnyCodable

final class DocumentResponseTests: XCTestCase {

    override func setUp() {
		super.setUp()
	}

    override func tearDown() {
		super.tearDown()
	}

	func testDecodingDocumentResponse_whenJSONIsValid() {
		let json = #"{ "documents": [{ "name": "projects/finance-ninja/databases/(default)/documents/stock_exchanges/3FYE9IBu7bWthrX1cyr7", "fields": { "name": { "stringValue": "PT AGRO" }, "symbol": { "stringValue": "UNVR.JK" } }, "createTime": "2020-02-25T21:49:18.481752Z", "updateTime": "2020-02-26T17:26:37.169779Z" }] }"#
		let jsonData = json.data(using: .utf8)!
		let documentResponse = try! JSONDecoder().decode(DocumentResponse.self, from: jsonData)
		
		let firstDocument = documentResponse.documents.first!
		XCTAssertEqual(firstDocument.name, "projects/finance-ninja/databases/(default)/documents/stock_exchanges/3FYE9IBu7bWthrX1cyr7")
		XCTAssertEqual(firstDocument.createTime, "2020-02-25T21:49:18.481752Z")
		XCTAssertEqual(firstDocument.updateTime, "2020-02-26T17:26:37.169779Z")
		XCTAssertEqual(firstDocument.fields, ["name": ["stringValue": AnyCodable("PT AGRO")], "symbol": ["stringValue": AnyCodable("UNVR.JK")]])
	}
	
	func testEncodingDocumentResponse_shouldGenerateValidJSON() {
		let fields = [
			"name": ["stringValue": AnyCodable("PT AGRO")],
			"symbol": ["stringValue": AnyCodable("UNVR.JK")]
		]
		let document = DocumentResponse.Document(name: "name",
												 fields: fields,
												 createTime: "createTime",
												 updateTime: "updateTime")
		let expectedDocumentResponse = DocumentResponse(documents: [document])
		let encodedJSON = try! JSONEncoder().encode(expectedDocumentResponse)
		
		
		let documentResponse = try! JSONDecoder().decode(DocumentResponse.self, from: encodedJSON)
		
		XCTAssertEqual(documentResponse, expectedDocumentResponse)
	}
}
