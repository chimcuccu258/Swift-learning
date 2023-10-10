//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Nga Vũ on 10/10/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
//            MeetingView()
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
