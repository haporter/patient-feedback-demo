//
//  DiagnosisFeedbackView.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/6/22.
//

import SwiftUI
import Combine

struct DiagnosisFeedbackView: View {
    
    var prompt: String
    var selection: CurrentValueSubject<Int?, Never>
    @State private var selected: Int?
    
    var body: some View {
        VStack {
            Text(prompt)
                .font(.headline)
            Spacer()
                .frame(height: 32)
            VStack {
                ForEach((1...5), id: \.self) { value in
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

struct DiagnosisFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        DiagnosisFeedbackView(prompt: "We appreciate the feedback, one last question: how do you feel about being diagnosed with The Plague?", selection: .init(nil))
    }
}
