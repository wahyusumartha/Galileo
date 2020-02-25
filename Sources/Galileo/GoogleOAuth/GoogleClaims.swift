//
//  GoogleClaims.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 24.02.20.
//

import Foundation
import SwiftJWT

struct GoogleClaims: Claims {
	let iss: String
	let sub: String 
	let aud: String = "https://firestore.googleapis.com/"
	let exp: Date?
	let iat: Date?
}
