//
//  MedicalRecordService.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/7/22.
//

import Foundation
import Combine

protocol MedicalRecordServiceType {
    func fetchRecord() -> AnyPublisher<TEMedicalRecord, Never>
}

struct MedicalRecordService: MedicalRecordServiceType {
    
    let session: Bundle
    
    init(session: Bundle = .main) {
        self.session = session
    }
    
    func fetchRecord() -> AnyPublisher<TEMedicalRecord, Never> {
        Just(session.decode(TEMedicalRecord.self, from: "patient-feedback-raw-data.json")).eraseToAnyPublisher()
    }
}
