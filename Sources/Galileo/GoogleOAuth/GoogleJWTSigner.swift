//
//  GoogleJWTSigner.swift
//  Galileo
//
//  Created by Wahyu Sumartha Priya Dharma on 24.02.20.
//

import Foundation
import SwiftJWT

final class GoogleJWTSigner {
	
	private let header: Header
	private let signer: JWTSigner
	private let claims: GoogleClaims

	init(privateKeyData: Data,
		 privateKeyId: String,
		 issuer: String,
		 subject: String) {
		self.header = Header(kid: privateKeyId)
		
		let currentDate = Date()
		let expiredDate = currentDate.addingTimeInterval(60 * 60)
		self.claims = GoogleClaims(iss: issuer,
								   sub: subject,
								   exp: expiredDate,
								   iat: currentDate)
		self.signer = JWTSigner.rs256(privateKey: privateKeyData)
	}
		
	func sign() throws -> String {
		var jwt = JWT(header: header, claims: claims)
		return try jwt.sign(using: signer)
	}
}
