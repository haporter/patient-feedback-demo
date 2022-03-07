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
            let record = dataController.record
            FeedbackFlowView(viewModel: .init(patient: record?.patient?.givenName ?? "",
                                              doctor: record?.doctor?.familyName ?? "",
                                              diagnosis: record?.diagnosis?.name ?? ""))
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
