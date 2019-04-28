//
//  JoinAGruopViewController.swift
//  Enclosures
//
//  Created by Christiano Mere on 03/04/2019.
//  Copyright © 2019 Christiano Mere. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class JoinAGruopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var gruopTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        
        gruopTableView.delegate = self
        gruopTableView.dataSource = self
        
        //Register your MessageCell.xib file here:
        gruopTableView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "customPlayerCell")
        
        configureTableView()
        
    }
    
    //Log out Button Pressed  (back to ViewController)
    @IBAction func logOutPressed(_ sender: Any) {
        
        SVProgressHUD.show()
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch {
            
            print("error, there, was a problem singing out.")

        }
        
       
        SVProgressHUD.show()
        
        //MARK: Delete user from firebase
        let user = Auth.auth().currentUser

        user?.delete { error in
            if error != nil {
                // An error happened.
                print("logout error")
                 SVProgressHUD.dismiss()
            } else {
                // Account deleted.
                self.performSegue(withIdentifier: "goToRegister", sender: self)
                 SVProgressHUD.dismiss()
                print ("logout successe")
                SVProgressHUD.dismiss()

            }
        }
        
    }
    
    ///////////////////////////////////////////

    
    // Ready Button Function
    @IBAction func readyButtonPressed(_ sender: Any) {
        
        func readyPressed() {
            performSegue(withIdentifier: "goToQuestionVC", sender: self)
        }
        
    readyPressed()
        
    }
    
    // Search Again Button Pressed
    @IBAction func searchAgainPressed(_ sender: Any) {
    }
    
    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customPlayerCell", for: indexPath) as! CustomCellTableViewCell
        
        // display number of register users near by.
        let userNamesArray = ["Christiano Mere", "Lizzie Hudson"]
        let initialCellArray = ["CM", "LH"]
        
        cell.userNamePlayerCell.text = userNamesArray[indexPath.row]
        cell.initialPlayerCell.text = initialCellArray[indexPath.row]
    
        return cell
    
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    //TODO: Declare tableViewTapped here:
    
    
    
    ///TODO: Declare configureTableView here:
    func configureTableView(){
        gruopTableView.rowHeight = UITableView.automaticDimension
        gruopTableView.estimatedRowHeight = 120
        
    }
    
    ///////////////////////////////////////////


}
