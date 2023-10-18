//
//  MapView.swift
//  Landmarks
//
//  Created by Nga Vũ on 16/10/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    // Create a private computed variable that holds the region information for the map.
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 12.268465, longitude: 109.201487),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

#Preview {
    MapView()
}
