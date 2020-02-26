//
//  Precondition.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import Foundation

/// A precondition on a document, used for conditional operations.
public enum Precondition {
	/// When set to true, the target document must exist.
	/// When set to false, the target document must not exist.
	case exists(Bool)
	
	/// When set, the target document must exist and have been last updated at that time.
	case updateTime(String)
}

extension Precondition: Equatable { }

extension Precondition: Encodable {
	enum CodingKeys: String, CodingKey {
		case exists
		case updateTime
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
		case .exists(let value):
			try container.encode(value, forKey: .exists)
		case .updateTime(let value):
			try container.encode(value, forKey: .updateTime)
		}
	}
}

extension Precondition: Decodable {
	public enum PreconditionCodingError: Error {
		case decoding
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if let value = try? container.decode(Bool.self, forKey: .exists) {
			self = .exists(value)
			return
		}
		
		if let value = try? container.decode(String.self, forKey: .updateTime) {
			self = .updateTime(value)
			return
		}
		
		throw PreconditionCodingError.decoding
	}
}
