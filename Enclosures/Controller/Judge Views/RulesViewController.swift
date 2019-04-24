//
//  RulesViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 23/04/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    @IBAction func startButtonPressed(_ sender: Any) {
        
        func startButtonPressed() {
            performSegue(withIdentifier: "goToCounterVC", sender: self)
        }
        
        startButtonPressed()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
