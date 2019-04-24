//
//  CounterViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 23/04/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {

    @IBOutlet weak var counterLable: UILabel!
    @IBOutlet weak var roundDisplay: UILabel!
    @IBOutlet weak var pauseButtonLabel: UIButton!
    
    var startValeu:Int = 5
    var counting:Bool = false
    let endValeu:Int = 0

    var timer:Timer = Timer()
    
    //MARK: Function set valeu
    @objc func counter() -> Void {
        startValeu -= 1
        counterLable.text = "\(startValeu)"
        
        if startValeu == endValeu{
            timer.invalidate()
            counting = false
            counterLable.text = "done"
        }
        
    }
    
    //MARK: Run timmer Funciotn
    func counterRunign() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        counting = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        counterRunign()
        
        //TODO:  add a func to go to the next veiw.
        if startValeu == endValeu {
            performSegue(withIdentifier: "goToRankingVC", sender: self)
        }
    
    }
    
    
     //MARK: Restart Method
    @IBAction func ResetCouterPressed(_ sender: Any) {
        startValeu = 61
        counter()
        
    }
    
    
     //MARK: Pause Method
    @IBAction func pauseCounterPressed(_ sender: Any) {
        
        //TODO: Need to add a function to make start again
            timer.invalidate()
        
    }
    
    //MARK: Button Back rules
    @IBAction func rulesButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "backOnVC", sender: self)
    }
    
}
