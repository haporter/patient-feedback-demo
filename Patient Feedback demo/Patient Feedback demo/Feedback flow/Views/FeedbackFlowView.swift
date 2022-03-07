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
    @ObservedObject var viewModel: FeedbackFlowViewModel
    
    var body: some View {
        VStack {
            HStack {
                if viewModel.showBackButton, let item = viewModel.currentFeedbackItem {
                    Button {
                        coordinator.navigateFeedback(for: item.rawValue - 1)
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }
                }
                Spacer()
                if let item = viewModel.currentFeedbackItem {
                    Button {
                        coordinator.navigateFeedback(for: item.rawValue + 1)
                    } label: {
                        HStack(spacing: 0) {
                            Text("Next")
                            Image(systemName: "chevron.forward")
                        }
                    }
                }
            }
            .padding()
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .inProgress(let value):
                viewModel.view(for: value)
            case .finished:
                FeedbackSummary(viewModel: viewModel)
            }
        }
        .interactiveDismissDisabled()
        .onAppear {
            coordinator.loadInitalState()
        }
    }
}

struct FeedbackFlowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackFlowView(viewModel: .init(patient: "Peter", doctor: "Strange", diagnosis: "The Plague"))
    }
}
