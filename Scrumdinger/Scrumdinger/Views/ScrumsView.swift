//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Nga Vũ on 10/10/2023.
//

import SwiftUI

struct ScrumsView: View {
//    let scrums: [DailyScrum]
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                //                CardView(scrum: scrum)
                //                .listRowBackground(scrum.theme.mainColor)
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
            }
            .navigationTitle("Daily Scrum")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingnewScrumView: $isPresentingNewScrumView)
        }
    }
}

//#Preview {
//    ScrumsView()
//}
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
//        ScrumsView(scrums: DailyScrum.sampleData)
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
