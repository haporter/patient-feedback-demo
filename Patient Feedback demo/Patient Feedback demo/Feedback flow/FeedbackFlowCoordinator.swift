//
//  FeedbackFlowCoordinator.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/5/22.
//

import SwiftUI

struct FeedbackFlowCoordinator {
    
    let viewModel: FeedbackFlowViewModel
    
    func navigateFeedback(for index: Int?) {
        guard let index = index else { return viewModel.state = .finished }
        
        if index <= 0 {
            viewModel.state = .inProgress(.recommend)
        } else if index > FeedbackItem.allCases.count - 1 {
            viewModel.state = .finished
        } else {
            viewModel.state = .inProgress(FeedbackItem.allCases[index])
        }
    }
    
    func loadInitalState() {
        viewModel.state = .inProgress(.recommend)
    }
}
