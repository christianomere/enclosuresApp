//
//  RegisterViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 30/03/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
  // hide Keybord
    func HidKeyboard(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func DismissKeboard(){
        view.endEditing(true)
    }
    
    
    ////////////////////////////////////////////// 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.HidKeyboard()
    }
    
    @IBAction func enterPressed(_ sender: Any) {
        
        SVProgressHUD.show()
        //New user Fire base setup
        Auth.auth().createUser(withEmail: emailTextField.text!, password: userNameTextField.text!) { (user,error) in
            
            if error != nil {
                print(error!)
                
            } else {
                
                // success
                print("Registration Successful")
                self.performSegue(withIdentifier: "goToJoinGruop", sender: self)
                SVProgressHUD.dismiss()
            }
            
        }
        
    }
    
    // Back Button Fucntion
    @IBAction func backButtonPressed(_ sender: Any) {
        
         self.performSegue(withIdentifier: "goToWelcomeScreem", sender: self)
    }
    
    
    // About Button Function
    @IBAction func AboutPressed(_ sender: Any) {
    }
    

}
