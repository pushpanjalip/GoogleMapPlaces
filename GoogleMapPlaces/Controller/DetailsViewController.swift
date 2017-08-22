//
//  DetailsViewController.swift
//  GoogleMapPlaces
//
//  Created by Pushpanjali Pawar on 1/9/17.
//  Copyright © 2017 Exult. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var Event:Events?
    
    let EventType:UILabel={
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        return typeLabel
    }()
    let EventCoordinates:UILabel={
        let coordinateLabel = UILabel()
        coordinateLabel.translatesAutoresizingMaskIntoConstraints = false
        return coordinateLabel
    }()
    override func viewDidLoad() {
        
        view.backgroundColor = .white
         if let title = Event?.title,let type = Event?.type,let coordinates=Event?.coordinates
         {
            self.navigationItem.title = title
            EventCoordinates.text = "Coordinates : \(coordinates)"
            switch type {
            case "ex":
                EventType.text = "Event Type : Exclusive Event"
                break
            case "pe":
                EventType.text = "Event Type : People Event"
                break
            default:
                EventType.text = "Event Type : Normal Event"
                break
            }
            
        }
        
        self.view.addSubview(EventType)
        self.view.addSubview(EventCoordinates)
        setUpTypeLabel()
        setUpCoordinateLabel()
    }
    func setUpTypeLabel(){
        EventType.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        EventType.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        EventType.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/2).isActive = true
        EventType.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    func setUpCoordinateLabel(){
        EventCoordinates.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        EventCoordinates.topAnchor.constraint(equalTo: EventType.bottomAnchor).isActive = true
        EventCoordinates.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        EventCoordinates.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    


}
