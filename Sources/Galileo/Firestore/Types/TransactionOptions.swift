//
//  TransactionOptions.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import Foundation

/// Options for creating a new transaction.
public enum TransactionOptions {
	/// The transaction can only be used for read operations.
	case readOnly(ReadOnly)
	
	/// The transaction can be used for both read and write operations.
	case readWrite(ReadWrite)
}

extension TransactionOptions: Equatable { }

extension TransactionOptions: Encodable {
	enum CodingKeys: String, CodingKey {
		case readOnly
		case readWrite
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
		case .readOnly(let readOnly):
			try container.encode(readOnly, forKey: .readOnly)
		case .readWrite(let readWrite):
			try container.encode(readWrite, forKey: .readWrite)
		}
	}
}

extension TransactionOptions: Decodable {
	
	public enum TransactionOptionsCodingError: Error {
		case decoding
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if let value = try? container.decode(ReadOnly.self, forKey: .readOnly) {
			self = .readOnly(value)
			return
		}
		
		if let value = try? container.decode(ReadWrite.self, forKey: .readWrite) {
			self = .readWrite(value)
			return
		}
		
		throw TransactionOptionsCodingError.decoding
	}
}

