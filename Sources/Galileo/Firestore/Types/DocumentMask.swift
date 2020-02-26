//
//  DocumentMask.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import Foundation

/// The `DocumentMask` is a struct which being used to specify fields
/// that going to be returned
public struct DocumentMask {
	/// The list of field paths in the mask
	/// Used to restrict a get or update operation on a document to a subset of its fields.
	public let fieldPaths: [String]
}

extension DocumentMask: Codable { }
extension DocumentMask: Equatable { }
