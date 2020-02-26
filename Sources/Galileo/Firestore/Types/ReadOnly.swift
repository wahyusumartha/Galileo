//
//  ReadOnly.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import Foundation

/// Options for a transaction that can only be used to read documents.
public struct ReadOnly {
	/// Reads documents at the given time. This may not be older than 60 seconds.
	/// A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z".
	public let readTime: String
}

extension ReadOnly: Codable { }
extension ReadOnly: Equatable { }
