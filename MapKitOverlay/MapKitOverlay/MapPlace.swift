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
    
    public func makeMapAdjustments() {
        self.setBottomRightCoordinate()
        self.makeBoundingRect()
    }
    
    private func setBottomRightCoordinate() {
        self.overlayBottomRightCoordinate = CLLocationCoordinate2DMake(self.overlayBottomLeftCoordinate.latitude, self.overlayTopRightCoordinate.longitude)
    }
    
    private func makeBoundingRect() {
        let topLeft = MKMapPointForCoordinate(self.overlayTopLeftCoordinate);
        let topRight = MKMapPointForCoordinate(self.overlayTopRightCoordinate);
        let bottomLeft = MKMapPointForCoordinate(self.overlayBottomLeftCoordinate);
    
        self.overlayBoundingMapRect = MKMapRectMake(topLeft.x, topLeft.y,
        fabs(topLeft.x - topRight.x),
        fabs(topLeft.y - bottomLeft.y));
    }
    
}
