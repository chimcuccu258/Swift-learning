//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Nga Vũ on 22/10/2023.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingnewScrumView: Bool
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingnewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingnewScrumView = false
                        }
                    }
                }
        }
    }
}

//#Preview {
//    NewScrumSheet()
//}
struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingnewScrumView: .constant(true))
    }
}
