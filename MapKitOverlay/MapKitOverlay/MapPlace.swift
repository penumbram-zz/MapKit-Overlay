//
//  MapPlace.swift
//  MapKitOverlay
//
//  Created by Tolga Caner on 05/02/17.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation
import MapKit

class MapPlace {
    var boundary : [CLLocationCoordinate2D]!
    var boundaryPointsCount : Int!
    var midCoordinate : CLLocationCoordinate2D!
    var overlayTopLeftCoordinate : CLLocationCoordinate2D!
    var overlayTopRightCoordinate : CLLocationCoordinate2D!
    var overlayBottomLeftCoordinate : CLLocationCoordinate2D!
    var overlayBottomRightCoordinate : CLLocationCoordinate2D!
    var overlayBoundingMapRect : MKMapRect!
    var name : String!
}
