//
//  LoginViewController.swift
//  PreBand
//
//  Created by Karthik Singh on 3/25/19.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser {
            performSegue(withIdentifier: "toHomeView", sender: nil)
        }
    }
    
    @IBAction func btnRocknRollPressed(_ sender: UIButton) {
        guard let email = txtEmail.text else { return }
        guard let password = txtPassword.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if (user != nil && error == nil) {
                self.performSegue(withIdentifier: "toHomeView", sender: nil)
            } else {
                print (error.debugDescription)
            }
        })
    }
}
