//
//  ViewController.swift
//  MapKitOverlay
//
//  Created by Tolga Caner on 05/02/17.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var place : MapPlace!
    var selectedOptions : Array<Any>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.selectedOptions = []
        self.populateData()
        let latDelta = self.place.overlayTopLeftCoordinate.latitude - self.place.overlayBottomRightCoordinate.latitude
        let span = MKCoordinateSpanMake(CLLocationDegrees(fabsf(Float(latDelta))), 0.0);
        let region = MKCoordinateRegionMake(self.place.midCoordinate, span);
        self.mapView.region = region;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addOverlay()
    }
    
    func addOverlay() {
        let overlay = MapPlaceOverlay(place: self.place)
        self.mapView.add(overlay)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let magicMountainImage = UIImage.init(named: "overlay_park")
        let overlayView = MapPlaceOverlayView.init(overlay: overlay, overlayImage: magicMountainImage!)
        return overlayView;
    }
    
    //Populating Map Data
    func populateData() {
        let mapPlace = MapPlace()
        mapPlace.midCoordinate = CLLocationCoordinate2DMake(34.4248, -118.5971)
        mapPlace.overlayTopLeftCoordinate = CLLocationCoordinate2DMake(34.4311, -118.6012)
        mapPlace.overlayTopRightCoordinate = CLLocationCoordinate2DMake(34.4311,-118.5912)
        mapPlace.overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(34.4194,-118.6012)
        let arrayOfPoints = self.getPoints()
        mapPlace.boundaryPointsCount = arrayOfPoints.count
        mapPlace.boundary = Array(repeating: CLLocationCoordinate2D(), count: arrayOfPoints.count)
        for i in 0..<mapPlace.boundaryPointsCount {
            mapPlace.boundary[i] = CLLocationCoordinate2DMake(CLLocationDegrees(arrayOfPoints[i].x),CLLocationDegrees(arrayOfPoints[i].y))
        }
        mapPlace.makeMapAdjustments()
        self.place = mapPlace
    }
    
    func getPoints() -> [CGPoint] {
        var array : [CGPoint] = []
        array.append(CGPoint(x: 34.4313, y: -118.59890))
        array.append(CGPoint(x: 34.4274, y: -118.60246))
        array.append(CGPoint(x: 34.4268, y: -118.60181))
        array.append(CGPoint(x: 34.4202, y: -118.6004))
        array.append(CGPoint(x: 34.42013, y: -118.59239))
        array.append(CGPoint(x: 34.42049, y: -118.59051))
        array.append(CGPoint(x: 34.42305, y: -118.59276))
        array.append(CGPoint(x: 34.42557, y: -118.59289))
        array.append(CGPoint(x: 34.42739, y: -118.59171))
        return array
    }
    
}

