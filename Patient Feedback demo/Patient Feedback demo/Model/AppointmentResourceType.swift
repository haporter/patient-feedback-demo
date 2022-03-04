//
//  AppointmentResourceType.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import Foundation

struct AppointmentResourceType: Codable {
    struct AppointmentPeriod: Codable {
        let start: Date
        let end: Date
    }
    struct AppointmentType: Codable {
        let text: String
    }
    
    let id: UUID
    let status: String
    let type: [AppointmentType]
    let subject: ResourceReference
    let actor: ResourceReference
    let period: AppointmentPeriod
}
