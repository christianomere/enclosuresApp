//
//  PlaceViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 23/04/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Back Function
    @IBAction func backButton(_ sender: Any) {
         performSegue(withIdentifier: "backOneVC", sender: self)
    }
    
}
