//
//  RecommendFeedbackView.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/5/22.
//

import SwiftUI
import Combine

struct RecommendFeedbackView: View {
    
    var prompt: String
    var selection: CurrentValueSubject<Int?, Never>
    @State private var selected: Int?
    
    var body: some View {
        VStack {
            Text(prompt)
                .font(.headline)
            Spacer()
                .frame(height: 32)
            Text("1 = Would not recommend, 10 = Would strongly recommend")
                .font(.footnote)
            VStack {
                ForEach((1...10).reversed(), id: \.self) { value in
                    let isSelected = selected == value
                    Button {
                        selection.send(value)
                        selected = value
                    } label: {
                        Text("\(value)")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(isSelected ? .blue : .clear))
                }
            }
        }
        .padding()
        Spacer()
    }
}

struct RecommendFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendFeedbackView(prompt: "Hi Peter, on a scale of 1-10, would you recommend Dr Strange to a friend or family member?", selection: .init(nil))
    }
}
