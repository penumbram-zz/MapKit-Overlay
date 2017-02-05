//
//  MapPlaceOverlayView.swift
//  MapKitOverlay
//
//  Created by Tolga Caner on 05/02/17.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import MapKit

class MapPlaceOverlayView : MKOverlayRenderer {
    
    var overlayImage : UIImage!
    
    init(overlay: MKOverlay, overlayImage : UIImage) {
        super.init(overlay: overlay)
        self.overlayImage = overlayImage
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        let imageReference = self.overlayImage.cgImage;
        assert(imageReference != nil, "Image not found!")
        let bMapRect = self.overlay.boundingMapRect;
        let rect = self.rect(for: bMapRect)
        
        context.scaleBy(x: 1.0, y: -1.0);
        context.translateBy(x: 0.0, y: -rect.size.height);
        context.draw(imageReference!, in: rect)
    }
    
}
