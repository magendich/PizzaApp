//
//  PinAdressAnnotation.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 21.11.2022.
//

import Foundation
import UIKit
import MapKit


class PinAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
    
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
}
