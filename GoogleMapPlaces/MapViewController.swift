//
//  ViewController.swift
//  GoogleMapPlaces
//
//  Created by Pushpanjali Pawar on 1/6/17.
//  Copyright © 2017 Exult. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController{
    var markersArray=[GMSMarker]()
    var eventList = [Events]()
       let mapView:GMSMapView={
        GMSServices.provideAPIKey("AIzaSyDc4OANTy7iYFy9fy71iE_Zduhkxpd90Dg")
        let camera = GMSCameraPosition.camera(withLatitude: 19.119661, longitude: 72.861408, zoom: 10)
        let mapView=GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    lazy var allEvents:UIButton={
        let button=UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("All", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleFilter), for: .touchUpInside)
        return button

    }()
    lazy var exclusiveEvents:UIButton={
        let button=UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("Exclusive", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleFilter), for: .touchUpInside)
        return button
        
    }()
    lazy var normalEvents:UIButton={
        let button=UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("Normal", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleFilter), for: .touchUpInside)
        return button
        
    }()
    lazy var peopleEvents:UIButton={
        let button=UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("People", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleFilter), for: .touchUpInside)
        return button
        
    }()


    func handleFilter(sender:UIButton){
        if let type = sender.titleLabel?.text
        {
            switch type {
            case "Exclusive":
                showMarker(filterType: "ex")
                break
            case "Normal":
                showMarker(filterType: "ev")
                break
            case "People":
                showMarker(filterType: "pe")
                break
            default:
                showMarker(filterType: "All")
                break
            }
        }
        
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(allEvents)
        self.view.addSubview(exclusiveEvents)
        self.view.addSubview(normalEvents)
        self.view.addSubview(peopleEvents)
        self.view.addSubview(mapView)
        parseJson()
        setUpAllEventButton()
        setUpExclusiveEventButton()
        setUpNormalEventButton()
        setUpPeopleEventButton()
        setUpMapView()
        showMarker(filterType: "All")
        
        
    }
    
}

