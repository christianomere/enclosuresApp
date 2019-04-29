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
    @IBOutlet weak var logInFeedbackLabel: UILabel!
    
    //MARK: Database Connetcion
    let userNameDB = Database.database().reference().child("userNameToDisplay")
    let userNameDictionary = ["userNameToDisplay": Auth.auth().currentUser?.email]

    // MARK: hide Keybord
    func HidKeyboard() {
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
        
        // MARK: New user Fire base setup
        Auth.auth().createUser(withEmail: emailTextField.text!, password: userNameTextField.text!) { (user,error) in
            
            if error != nil {
                print(error!)
                self.logInFeedbackLabel.text = "email or user name is alred used"
                self.logInFeedbackLabel.textColor = .red
                SVProgressHUD.dismiss()

            } else {
                
                // success
                self.performSegue(withIdentifier: "goToJoinGruop", sender: self)
               
                SVProgressHUD.dismiss()
                
            }
            
        }
        
        //MARK: making the data base of usernames
        userNameTextField.endEditing(true)
        
        
        let userNameDB = Database.database().reference().child("userName")
        let userDictionary = ["Sender": Auth.auth().currentUser?.email, "userName": userNameTextField.text!]
        
        userNameDB.childByAutoId().setValue(userDictionary) {
            (error, reference) in
           
            if error != nil {
                print (error!)
            } else {
                print("message save")
                
               
            }
        }
        
        
    }
    

    // MARK: Back Button Fucntion
    @IBAction func backButtonPressed(_ sender: Any) {
        
         self.performSegue(withIdentifier: "goToWelcomeScreem", sender: self)
    }
    
    
    // MARK: About Button Function
    @IBAction func AboutPressed(_ sender: Any) {
    }
    

}
