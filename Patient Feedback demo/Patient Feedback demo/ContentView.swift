//
//  ContentView.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showFeedback = false
    
    var body: some View {
        Button {
            showFeedback.toggle()
        } label: {
            Text("Give Feedback")
        }
            .padding()
            .sheet(isPresented: $showFeedback, onDismiss: nil, content: FeedbackFlowView.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
