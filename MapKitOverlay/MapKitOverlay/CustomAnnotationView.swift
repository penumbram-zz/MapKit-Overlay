//
//  CustomAnnotationView.swift
//  MapKitOverlay
//
//  Created by Tolga Caner on 06/02/17.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import MapKit

class CustomAnnotationView: MKAnnotationView {
    
    init(annotation: MKAnnotation?, reuseIdentifier: String?, image : UIImage) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
