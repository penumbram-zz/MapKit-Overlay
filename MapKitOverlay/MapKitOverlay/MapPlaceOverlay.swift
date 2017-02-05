//
//  MapPlaceOverlay.swift
//  MapKitOverlay
//
//  Created by Tolga Caner on 05/02/17.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import MapKit


class MapPlaceOverlay : NSObject, MKOverlay {
    
    public var coordinate: CLLocationCoordinate2D
    public var boundingMapRect: MKMapRect
    
    init(place: MapPlace) {
        self.boundingMapRect = place.overlayBoundingMapRect
        self.coordinate = place.midCoordinate
    }
    
}
