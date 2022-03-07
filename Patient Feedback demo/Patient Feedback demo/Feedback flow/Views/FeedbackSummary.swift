//
//  FeedbackSummary.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/6/22.
//

import SwiftUI

struct FeedbackSummary: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: FeedbackFlowViewModel
    
    var body: some View {
        VStack {
            Text("Thanks again! Here’s what we heard:")
                .font(.headline)
            Spacer()
                .frame(height: 32)
            VStack(alignment: .leading, spacing: 16) {
                ForEach(FeedbackItem.allCases, id: \.self) { value in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(viewModel.prompt(for: value))
                            .font(.caption)
                            .frame(alignment: .leading)
                        Text("Response: \(viewModel.response(for: value).description)")
                            .font(.footnote)
                            .fontWeight(.medium)
                    }
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(8)
                }
            }
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done")
            }
        }
        .padding()
    }
}

struct FeedbackSummary_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSummary(viewModel: .init(patient: "Peter", doctor: "Strange", diagnosis: "The Plague"))
    }
}
