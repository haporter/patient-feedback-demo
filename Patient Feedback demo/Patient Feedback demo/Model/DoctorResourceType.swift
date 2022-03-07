//
//  DoctorResourceType.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import Foundation

struct DoctorResourceType: Codable {
    let id: UUID
    let name: [Name]
}

extension DoctorResourceType {
    var familyName: String {
        name.first?.family ?? ""
    }
}
