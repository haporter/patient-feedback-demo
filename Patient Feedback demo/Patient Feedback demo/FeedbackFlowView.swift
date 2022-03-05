//
//  FeedbackFlowView.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/5/22.
//

import SwiftUI

struct FeedbackFlowView: View {
    
    var coordinator: FeedbackFlowCoordinator {
        FeedbackFlowCoordinator(viewModel: viewModel)
    }
    @ObservedObject var viewModel = FeedbackFlowViewModel()
    
    var body: some View {
        VStack {
            HStack {
                if viewModel.showBackButton {
                    Button {
                        coordinator.responseTapped(Int.random(in: 0...3))
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }
                }
                Spacer()
            }
            .padding()
            switch viewModel.state {
            case .idle(let error):
                Color.red
            case .inProgress(let value):
                
            case .finished:
                Color.blue
            }
        }
        .interactiveDismissDisabled()
    }
}

struct FeedbackFlowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackFlowView()
    }
}
