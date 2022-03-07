//
//  FeedbackFlowViewModel.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/5/22.
//

import SwiftUI
import Combine

enum FeedbackItem: Int, CaseIterable {
    case recommend
    case diagnosis
    case overall
}

class FeedbackFlowViewModel: ObservableObject {
    
    enum State {
        case idle(Error?)
        case inProgress(FeedbackItem)
        case finished
    }
    
    @Published var showBackButton = false
    @Published var showNextButton = true
    @Published var state: State = .idle(nil)
    var recommendResponse = CurrentValueSubject<Int?, Never>(nil)
    var diagnosisResponse = CurrentValueSubject<Int?, Never>(nil)
    var overallResponse = CurrentValueSubject<Int?, Never>(nil)
    var patient: String
    var doctor: String
    var diagnosis: String
    private var cancellables = Set<AnyCancellable>()
    var currentFeedbackItem: FeedbackItem? {
        if case let .inProgress(item) = state {
            return item
        }
        return nil
    }
    
    init(patient: String, doctor: String, diagnosis: String) {
        self.patient = patient
        self.doctor = doctor
        self.diagnosis = diagnosis
        
        subscribe()
    }
    
    private func subscribe() {
        Publishers.CombineLatest3(recommendResponse, diagnosisResponse, overallResponse)
            .sink { value in
                // Sync with API
                print(value)
            }
            .store(in: &cancellables)
        
        $state
            .sink { [weak self] newState in
                switch newState {
                case .inProgress(let item):
                    if item == .recommend {
                        self?.showBackButton = false
                    } else {
                        self?.showBackButton = true
                    }
                case .finished:
                    self?.showNextButton = false
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
    
    @ViewBuilder
    func view(for feedbackItem: FeedbackItem) -> some View {
        let prompt = prompt(for: feedbackItem)
        switch feedbackItem {
        case .recommend:
            RecommendFeedbackView(prompt: prompt, selection: recommendResponse)
        case .diagnosis:
            DiagnosisFeedbackView(prompt: prompt, selection: diagnosisResponse)
        case .overall:
            FeelAboutDiagnosisView(prompt: prompt, selection: overallResponse)
        }
    }
    
    func prompt(for feedbackItem: FeedbackItem) -> String {
        switch feedbackItem {
        case .recommend:
            return "Hi \(patient), on a scale of 1-10, would you recommend Dr \(doctor) to a friend or family member?"
        case .diagnosis:
            return "Thank you. You were diagnosed with \(diagnosis). Did Dr \(doctor) explain how to manage this diagnosis in a way you could understand?"
        case .overall:
            return "We appreciate the feedback, one last question: how do you feel about being diagnosed with \(diagnosis)?"
        }
    }
    
    func response(for feedbackItem: FeedbackItem) -> CustomStringConvertible {
        let value: Int?
        switch feedbackItem {
        case .recommend:
            value = recommendResponse.value
        case .diagnosis:
            value = diagnosisResponse.value
        case .overall:
            value = overallResponse.value
        }
        return value ?? "no response given"
    }
}
