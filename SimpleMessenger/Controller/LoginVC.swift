//
//  ViewController.swift
//  SimpleMessenger
//
//  Created by Ali Ataya on 1/12/20.
//  Copyright © 2020 Ali Ataya. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var simpleChatIntro: UILabel!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signInUp: UIButton!
    
    
    
    //Vars
    
    var userID: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textAnim(simpleChatIntro)
    }
    

    
    @IBAction func signIn(_ sender: Any) {
        
        if let email = emailLabel.text, let password = passwordLabel.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
                
                if error == nil {
                    self.userID = Auth.auth().currentUser!.uid

                     KeychainWrapper.standard.set(self.userID, forKey: "uid")
                    
                     self.performSegue(withIdentifier: "toMessages", sender: nil)
                } else {
                    
                    self.performSegue(withIdentifier: "signUp", sender: nil)
                    
                }
                
            })
            
        }
        
        
    }
    

    
    //Text Animation ----------------------------------------------------
    func textAnim(_ label: UILabel) {
        label.isHidden = false
        label.alpha = 0
           UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
                  label.alpha = 1.0
                  }, completion: {
                      finished in
        })
    }


}

