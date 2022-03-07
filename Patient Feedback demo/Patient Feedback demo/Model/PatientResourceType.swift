//
//  PatientResourceType.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import Foundation

struct PatientResourceType: Codable {
    struct Address: Codable {
        let use: String
        let line: [String]
    }
    
    struct Contact: Codable {
        let system: String
        let value: String
        let use: String
    }
    
    let id: UUID
    let name: [Name]
    let active: Bool
    let contact: [Contact]
    let gender: String
    let birthDate: String
    let address: [Address]
}

extension PatientResourceType {
    var givenName: String {
        name.first?.given.first ?? ""
    }
}
