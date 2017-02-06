//
//  SelectionViewController.swift
//  MapKitOverlay
//
//  Created by Tolga Caner on 05/02/17.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit
import MapKit

class SelectionViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier != nil) {
            switch segue.identifier! {
                case "btn1":
                    if let viewController = segue.destination as? ViewController {
                        viewController.place = self.populateData(1)
                    }
                    break
                case "btn2":
                    if let viewController = segue.destination as? ViewController {
                        viewController.place = self.populateData(2)
                    }
                    break
                case "btn3":
                    if let viewController = segue.destination as? ViewController {
                        viewController.place = self.populateData(3)
                    }
                break
                default:
                    break
            }
        }
    }
    
    //Populating Map Data
    func populateData(_ type : Int) -> MapPlace {
        let mapPlace = MapPlace()
        let arrayOfPoints = self.getPoints(type)
        switch type {
        case 1:
            mapPlace.midCoordinate = CLLocationCoordinate2DMake(34.4248, -118.5971)
            mapPlace.overlayTopLeftCoordinate = CLLocationCoordinate2DMake(34.4311, -118.6012)
            mapPlace.overlayTopRightCoordinate = CLLocationCoordinate2DMake(34.4311,-118.5912)
            mapPlace.overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(34.4194,-118.6012)
            mapPlace.boundaryPointsCount = arrayOfPoints.count
            mapPlace.boundary = Array(repeating: CLLocationCoordinate2D(), count: arrayOfPoints.count)
            mapPlace.name = "overlay_park"
            for i in 0..<mapPlace.boundaryPointsCount {
                mapPlace.boundary[i] = CLLocationCoordinate2DMake(CLLocationDegrees(arrayOfPoints[i].x),CLLocationDegrees(arrayOfPoints[i].y))
            }
        case 2:
            mapPlace.midCoordinate = CLLocationCoordinate2DMake(41.109036, 29.019867)
            mapPlace.overlayTopLeftCoordinate = CLLocationCoordinate2DMake(41.109086, 29.019687)
            mapPlace.overlayTopRightCoordinate = CLLocationCoordinate2DMake(41.109086, 29.019817)
            mapPlace.overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(41.108986, 29.019687)
            mapPlace.boundaryPointsCount = arrayOfPoints.count
            mapPlace.boundary = Array(repeating: CLLocationCoordinate2D(), count: arrayOfPoints.count)
            mapPlace.name = "starbucks"
            for i in 0..<mapPlace.boundaryPointsCount {
                mapPlace.boundary[i] = CLLocationCoordinate2DMake(CLLocationDegrees(arrayOfPoints[i].x),CLLocationDegrees(arrayOfPoints[i].y))
            }
        case 3:
            let point = CustomPointAnnotation()
            let image = UIImage(named: "starbucks")
            let size = image!.size
            let newSize = CGSize(width: size.width * 0.4, height: size.height * 0.4)
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
            image?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            point.image = resizedImage
            
            mapPlace.midCoordinate = CLLocationCoordinate2DMake(41.109036, 29.019867)
            mapPlace.overlayTopLeftCoordinate = CLLocationCoordinate2DMake(41.109086, 29.019687)
            mapPlace.overlayTopRightCoordinate = CLLocationCoordinate2DMake(41.109086, 29.019817)
            mapPlace.overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(41.108986, 29.019687)
            point.coordinate = CLLocationCoordinate2DMake(41.109036, 29.019867)
            mapPlace.customPointAnnotation = point
//            point.image = nil
        default:
            break
        }
        mapPlace.makeMapAdjustments()
        return mapPlace
    }
    
    func getPoints(_ type : Int) -> [CGPoint] {
        var array : [CGPoint] = []
        switch type {
        case 1:
            array.append(CGPoint(x: 34.4313, y: -118.59890))
            array.append(CGPoint(x: 34.4274, y: -118.60246))
            array.append(CGPoint(x: 34.4268, y: -118.60181))
            array.append(CGPoint(x: 34.4202, y: -118.6004))
            array.append(CGPoint(x: 34.42013, y: -118.59239))
            array.append(CGPoint(x: 34.42049, y: -118.59051))
            array.append(CGPoint(x: 34.42305, y: -118.59276))
            array.append(CGPoint(x: 34.42557, y: -118.59289))
            array.append(CGPoint(x: 34.42739, y: -118.59171))
            break
        default:
            break
        }
        return array
    }
    
}
