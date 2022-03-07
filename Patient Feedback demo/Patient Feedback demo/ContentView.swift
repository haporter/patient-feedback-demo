//
//  ContentView.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var dataController = DataController()
    @State private var showFeedback = false
    
    var body: some View {
        Button {
            showFeedback.toggle()
        } label: {
            Text("Give Feedback")
        }
        .disabled(dataController.isLoading)
        .padding()
        .sheet(isPresented: $showFeedback, onDismiss: nil) {
            FeedbackFlowView(viewModel: .init(patient: "Peter",
                                              doctor: "Strange",
                                              diagnosis: "The Plague"))
        }
        .onAppear {
            dataController.loadRecords()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
