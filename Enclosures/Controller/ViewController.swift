//
//  ViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 30/03/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    //Declare instance variables here
    let locationManager = CLLocationManager()
    
    @IBAction func startPressed(_ sender: Any) {
        
        //location manager settings.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
   
    
     // About Button Function
    @IBAction func aboutPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

