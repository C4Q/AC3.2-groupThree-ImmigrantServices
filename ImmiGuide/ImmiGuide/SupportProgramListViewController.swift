//
//  SupportProgramListViewController.swift
//  ImmiGuide
//
//  Created by Madushani Lekam Wasam Liyanage on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SupportProgramListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate{
    
    @IBOutlet weak var programListTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var programList: [SupportProgram] = []
    let initialLocation = CLLocation(latitude: 40.7128, longitude: -74.0059)
    let regionRadius: CLLocationDistance = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        programListTableView.delegate = self
        programListTableView.dataSource = self
        mapView.delegate = self
        mapView.mapType  = .standard
        mapView.isZoomEnabled = true
        mapView.showsPointsOfInterest = false
        centerMapOnLocation(location: initialLocation)
        
        addPin(at: "NYC", lat: 40.7128, long: -74.0059)
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programIdentifier", for: indexPath) as! ProgramListTableViewCell
        
        let index = programList[indexPath.row]
        let description = index.location.description
        cell.siteNameLabel.text = index.siteName
        cell.addressLabel.text = description
        cell.contactNumberLabel.text = "Contact: \(index.contactNumber)"
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = programList[indexPath.row]
        let geoLocation = index.location.geolocation
        let lat = geoLocation.latitude
        let long = geoLocation.longitude

        addPin(at: index.siteName, lat: lat, long: long)
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0,
                                                                  regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func addPin(at name: String, lat: Double, long: Double){
        let pinlocation = CLLocation(latitude: lat, longitude: long)
        let pinAnnotation: MKPointAnnotation = MKPointAnnotation()
        pinAnnotation.title = name
        pinAnnotation.coordinate = pinlocation.coordinate
        let oldAnnotations = mapView.annotations
        mapView.removeAnnotations(oldAnnotations)
        mapView.addAnnotation(pinAnnotation)
        centerMapOnLocation(location: pinlocation)
        self.mapView.reloadInputViews()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
