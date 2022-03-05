//
//  TEMedicalRecord.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import Foundation

struct TEMedicalRecord: Decodable {
    let id: UUID
    let resourceType: String
    let timestamp: Date
    let entry: [Entry]
}
