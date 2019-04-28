//
//  PlaceViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 23/04/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {

    @IBOutlet weak var enclosurePlaceName: UILabel!
    
    let enclosureList = ["Glencoe","Cochamba Water", "Hakuna Matata", "Murton Fell", "Hilton Fell", "Warcop Fell", "Adamastor Miradoura","Otmoor Common"," Isle of Axholme", "Ariège, Wingfield’s Plantation", "Universidad Nacional Bogota", "Parque Símon Bolívar", "Parque Chicó", "Kings’ Sedgmoor", "Martim Moniz", "Cyfeiliog", "Fordlândia", "NHS Community Care Surrey"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //MARK: Random meth to call places OBS: Find a way to do this from a firebase and not display the same name two times
        let randomPlace = enclosureList.randomElement()!
        enclosurePlaceName.text = randomPlace

        
    }
    
    //MARK: Back Function
    @IBAction func backButton(_ sender: Any) {
         performSegue(withIdentifier: "backOneVC", sender: self)
    }
    
}
