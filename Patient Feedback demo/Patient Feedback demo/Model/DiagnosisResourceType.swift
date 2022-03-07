//
//  DiagnosisResourceType.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import Foundation

struct DiagnosisResourceType: Codable {
    struct MedicalCodes: Codable {
        struct Coding: Codable {
            let system: URL
            let code: String
            let name: String
        }
        
        let coding: [Coding]
    }
    struct MetaData: Codable {
        let lastUpdated: Date
    }
    
    let id: UUID
    let meta: MetaData
    let status: String
    let code: MedicalCodes
    let appointment: ResourceReference
}

extension DiagnosisResourceType {
    var name: String? {
        code.coding.first?.name
    }
}
