//
//  FeedbackFlowViewModel.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/5/22.
//

import Foundation
import SwiftUI

class FeedbackFlowViewModel: ObservableObject {
    
    enum State {
        case idle(Error?)
        case inProgress(Color)
        case finished
    }
    
    @Published var showBackButton = true
    @Published var state: State = .idle(nil)
}
