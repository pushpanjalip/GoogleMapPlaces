//
//  Events.swift
//  GoogleMapPlaces
//
//  Created by Pushpanjali Pawar on 1/6/17.
//  Copyright © 2017 Exult. All rights reserved.
//

import Foundation
import  GoogleMaps
class Events:NSObject{
    var title:String?
    var coordinates:String?
    var type:String?
    var lattitude:CLLocationDegrees?
    var longitude:CLLocationDegrees?
    init(title: String, coordinates: String, type: String,lattitude:CLLocationDegrees,longitude:CLLocationDegrees) {
        self.title = title
        self.coordinates = coordinates
        self.type = type
        self.lattitude = lattitude
        self.longitude = longitude  
        super.init()
    }


}
