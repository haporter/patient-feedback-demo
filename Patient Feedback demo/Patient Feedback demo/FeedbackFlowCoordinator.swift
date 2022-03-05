//
//  FeedbackFlowCoordinator.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/5/22.
//

import Foundation
import SwiftUI

struct FeedbackFlowCoordinator {
    
    let viewModel: FeedbackFlowViewModel
    
    func responseTapped(_ response: Int) {
        let colors: [Color] = [.orange, .gray, .white, .purple]
        if response > colors.count - 1 {
            viewModel.state = .idle(nil)
        } else {
            viewModel.state = .inProgress(colors[response])
        }
    }
}
