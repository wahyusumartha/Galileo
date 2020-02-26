//
//  DocumentResponse.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 26.02.20.
//

import Foundation
import AnyCodable

public struct DocumentResponse {
	public let documents: [Document]
}

extension DocumentResponse: Codable { }
extension DocumentResponse: Equatable { }
