//
//  FeedbackFlowViewModelTests.swift
//  Patient Feedback demoTests
//
//  Created by Andrew Porter on 3/7/22.
//

import XCTest
import Combine

@testable import Patient_Feedback_demo

class FeedbackFlowViewModelTests: XCTestCase {
    
    enum Constant {
        static let expectationTimeout: TimeInterval = 0.1
    }
    
    let doctorName = "Strange"
    let patientName = "Peter"
    let diagnosis = "The Plague"
    
    var sut: FeedbackFlowViewModel {
        FeedbackFlowViewModel(patient: patientName, doctor: doctorName, diagnosis: diagnosis)
    }

    func testRecommendPromptForFeedbackItem() {
        let prompt = sut.prompt(for: .recommend)
        XCTAssertEqual(prompt, "Hi \(patientName), on a scale of 1-10, would you recommend Dr \(doctorName) to a friend or family member?")
    }

    func testDiagnosisPromptForFeedbackItem() {
        let prompt = sut.prompt(for: .diagnosis)
        XCTAssertEqual(prompt, "Thank you. You were diagnosed with \(diagnosis). Did Dr \(doctorName) explain how to manage this diagnosis in a way you could understand?")
    }
    
    func testOverallPromptForFeedbackItem() {
        let prompt = sut.prompt(for: .overall)
        XCTAssertEqual(prompt, "We appreciate the feedback, one last question: how do you feel about being diagnosed with \(diagnosis)?")
    }
}
