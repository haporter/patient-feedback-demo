//
//  Entry.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import Foundation

enum Entry: Decodable {
    private enum ResourceType: String, Codable {
        case patient = "Patient"
        case doctor = "Doctor"
        case appointment = "Appointment"
        case diagnosis = "Diagnosis"
    }
    
    case patientType(PatientResourceType)
    case doctorType(DoctorResourceType)
    case appointmentType(AppointmentResourceType)
    case diagnosisType(DiagnosisResourceType)
    
    private enum CodingKeys: String, CodingKey { case resource, resourceType }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .resource)
        
        let resourceType = try nestedContainer.decode(ResourceType.self, forKey: .resourceType)
        switch resourceType {
        case .patient:
            self = .patientType(try container.decode(PatientResourceType.self, forKey: .resource))
        case .doctor:
            self = .doctorType(try container.decode(DoctorResourceType.self, forKey: .resource))
        case .appointment:
            self = .appointmentType(try container.decode(AppointmentResourceType.self, forKey: .resource))
        case .diagnosis:
            self = .diagnosisType(try container.decode(DiagnosisResourceType.self, forKey: .resource))
        }
    }
}
