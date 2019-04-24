//
//  QuestionViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 23/04/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit
import Firebase

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var fristQuestionAlert: UILabel!
    @IBOutlet weak var secoundQuestionTitle: UILabel!
    @IBOutlet weak var secundQuestionAlert: UILabel!
    
    var frisQuestionAnwser:Bool = true
    var secundQuestionAnwser:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fristQuestionButtonYes(_ sender: Any) {
       frisQuestionAnwser = true
        
    }
    
    @IBAction func fristQuestionButtonNo(_ sender: Any) {
        frisQuestionAnwser = false
    }
    
    
    
    @IBAction func secundQuestionButtonYes(_ sender: Any) {
        secundQuestionAnwser = true
        
        //MARK: Validation of anwsers and feed back
        if frisQuestionAnwser && secundQuestionAnwser == true {
            
            performSegue(withIdentifier: "goToPlaceVC", sender: self)
            
        } else {
            
            secundQuestionAlert.textColor = UIColor.red
            fristQuestionAlert.textColor = UIColor.red
        }
    }
    
    @IBAction func secundQuestionButtonNo(_ sender: Any) {
        
        secundQuestionAnwser = false
        
        
    }
    
    //////////////////////////////////////////////////////
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "backOneVC", sender: self)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch {
            
            print("error, there, was a problem singing out.")
            
        }
        
    }
    
}
