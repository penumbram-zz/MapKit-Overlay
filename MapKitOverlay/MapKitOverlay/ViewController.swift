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
        let latDelta = self.place.overlayTopLeftCoordinate.latitude - self.place.overlayBottomRightCoordinate.latitude
        let span = MKCoordinateSpanMake(CLLocationDegrees(fabsf(Float(latDelta))), 0.0)
        let region = MKCoordinateRegionMake(self.place.midCoordinate, span)
        self.mapView.region = region
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.place.customPointAnnotation == nil {
            self.addOverlay()
        } else {
            self.mapView.addAnnotation(self.place.customPointAnnotation!)
        }
    }
    
    func addOverlay() {
        let overlay = MapPlaceOverlay(place: self.place)
        self.mapView.add(overlay)
    }
    
    
    //Rendering custom images
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let image = UIImage.init(named: self.place.name)
        let overlayView = MapPlaceOverlayView.init(overlay: overlay, overlayImage: image!)
        return overlayView
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let customPointAnnotation = annotation as? CustomPointAnnotation {
            let customAnnotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: nil, image: customPointAnnotation.image)
            return customAnnotationView
        }
        
        return nil
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

