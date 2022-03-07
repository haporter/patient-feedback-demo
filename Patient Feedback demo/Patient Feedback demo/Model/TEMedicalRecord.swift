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

extension TEMedicalRecord {
    var appointment: AppointmentResourceType? {
        for entry in entry {
            if case let .appointmentType(appointmentValue) = entry {
                return appointmentValue
            }
        }
        return nil
    }
    
    var doctor: DoctorResourceType? {
        for entry in entry {
            if case let .doctorType(appointmentValue) = entry {
                return appointmentValue
            }
        }
        return nil
    }
    
    var patient: PatientResourceType? {
        for entry in entry {
            if case let .patientType(appointmentValue) = entry {
                return appointmentValue
            }
        }
        return nil
    }
    
    var diagnosis: DiagnosisResourceType? {
        for entry in entry {
            if case let .diagnosisType(appointmentValue) = entry {
                return appointmentValue
            }
        }
        return nil
    }
}
