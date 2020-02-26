//
//  ReadWrite.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import Foundation

/// Options for a transaction that can be used to read and write documents.
public struct ReadWrite {
	/// An optional transaction to retry
	/// A base64-encoded string.
	public let retryTransaction: String
}

extension ReadWrite: Codable { }
extension ReadWrite: Equatable { }
