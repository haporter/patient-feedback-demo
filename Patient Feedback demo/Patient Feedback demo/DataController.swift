//
//  DataController.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/7/22.
//

import SwiftUI
import Combine

class DataController: ObservableObject {
    
    let medicalRecordService: MedicalRecordServiceType
    private var cancellables = Set<AnyCancellable>()
    private(set) var record: TEMedicalRecord?
    @Published var isLoading: Bool = false
    
    init(medicalRecordService: MedicalRecordServiceType = MedicalRecordService()) {
        self.medicalRecordService = medicalRecordService
    }
    
    func loadRecords() {
        isLoading = true
        medicalRecordService
            .fetchRecord()
            .subscribe(on: DispatchQueue.global(), options: nil)
            .handleEvents(receiveOutput: set(records:))
            .receive(on: DispatchQueue.main, options: nil)
            .sink { [weak self] value in
                self?.isLoading = false
                debugPrint(value)
            }
            .store(in: &cancellables)
    }
    
    private func set(records fetchedRecord: TEMedicalRecord) {
        self.record = fetchedRecord
    }
}
