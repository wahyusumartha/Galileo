//
//  DocumentResponse.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import Foundation
import AnyCodable

public struct DocumentResponse {

	/// A Firestore document response from the server
	public struct Document {
		/// The resource name of the document
		public let name: String
		
		/// The document's fields represented by dictionary.
		/// The key represent field names
		public let fields: [String: [String: AnyCodable]]
		
		/// The time at which the document was created
		public let createTime: String
		
		/// The time at which the document was last changed
		public let updateTime: String
		
		enum CodingKeys: String, CodingKey {
			case name
			case fields
			case createTime
			case updateTime
		}
	}

	public let documents: [Document]
}

extension DocumentResponse: Codable { }
extension DocumentResponse.Document: Codable { }
extension DocumentResponse: Equatable { }
extension DocumentResponse.Document: Equatable { }
