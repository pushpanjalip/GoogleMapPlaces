//
//  MapViewControllerExtension.swift
//  GoogleMapPlaces
//
//  Created by Pushpanjali Pawar on 1/6/17.
//  Copyright © 2017 Exult. All rights reserved.
//

import UIKit
import  GoogleMaps
extension MapViewController:GMSMapViewDelegate{

    func parseJson(){
        if let path = Bundle.main.path(forResource: "EventList", ofType: "json")
        {
            do
            {
                let jsonData = try NSData(contentsOfFile: path, options: .dataReadingMapped)
                do{
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! NSDictionary
                    
                    
                    
                    
                    if let eventData : NSArray = jsonResult["data"] as? NSArray
                    {
                        getValue(dataArray: eventData)
                    }
                }
                catch{print("Handle \(error) here")}
            }//do
            catch{
                print("Handle \(error) here")
            }//catch
            
        }//path
    }//parseJson
    func getValue(dataArray: NSArray) {
        for event in dataArray as! [NSDictionary]
        {
            let title = event.object(forKey: "title")
            let coordinate = event.object(forKey: "coordinate") as! String
            let coordinateArray = coordinate.components(separatedBy: ",")
            
            let lat = (NumberFormatter().number(from: coordinateArray[0])?.doubleValue)! as CLLocationDegrees
            let long = (NumberFormatter().number(from: coordinateArray[1])?.doubleValue)! as CLLocationDegrees
            let type = event.object(forKey: "type")
            
            let event = Events(title: title as! String, coordinates: coordinate, type: type as! String, lattitude: lat, longitude: long)
            
                eventList.append(event)
        }
        
    }
    func setUpMapView(){
         mapView.delegate = self
         mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
         mapView.topAnchor.constraint(equalTo: allEvents.bottomAnchor).isActive = true
         mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
         mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    
    }
    func showMarker(filterType:String){
        
        mapView.clear()
       
          for event: Events in eventList
         {
            
            if let lat = event.lattitude , let long = event.longitude ,let type = event.type
            {
            let currentLocation=CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                let marker = GMSMarker(position: currentLocation)
                marker.title = event.title
                marker.userData = event
                
               
                //customize marker color
                switch type {
                case "ex":
                    marker.icon = GMSMarker.markerImage(with: .blue)
                    
                    break
                case "ev":
                    marker.icon = GMSMarker.markerImage(with: .green)
                    break
                default:
                    marker.icon = GMSMarker.markerImage(with: .red)
                    
                    break
                }
                switch filterType {
                case "ex":
                    if event.type == "ex"
                    {
                        
                        marker.map = mapView
                    }
                    else
                    {
                        marker.map = nil
                    }
                    break
                case "ev":
                    if event.type == "ev"
                    {
                        marker.map = mapView
                    }
                    else
                    {
                        marker.map = nil
                    }
                    break
                case "pe":
                    if event.type == "pe"
                    {
                        marker.map = mapView
                    }
                    else
                    {
                        marker.map = nil
                    }
                    break

                default:
                    marker.map = mapView
                    break
                }
                
            }
         }
        
        
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let destinationVC=DetailsViewController()
        
        destinationVC.Event = marker.userData as! Events?
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    func setUpAllEventButton(){
        allEvents.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        allEvents.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        allEvents.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/4).isActive = true
        allEvents.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    
    }
    func setUpExclusiveEventButton(){
        exclusiveEvents.leftAnchor.constraint(equalTo: allEvents.rightAnchor, constant: 0).isActive = true
        exclusiveEvents.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        exclusiveEvents.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/4).isActive = true
        exclusiveEvents.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    func setUpNormalEventButton(){
        normalEvents.leftAnchor.constraint(equalTo: exclusiveEvents.rightAnchor, constant: 0).isActive = true
        normalEvents.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        normalEvents.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/4).isActive = true
        normalEvents.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    func setUpPeopleEventButton(){
        peopleEvents.leftAnchor.constraint(equalTo:normalEvents.rightAnchor, constant: 0).isActive = true
        peopleEvents.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        peopleEvents.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/4).isActive = true
        peopleEvents.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }


      
}
