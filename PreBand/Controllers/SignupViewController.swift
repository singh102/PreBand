//
//  SignupViewController.swift
//  PreBand
//
//  Created by Karthik Singh on 3/26/19.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnContinuePressed(_ sender: UIButton) {

        if let email = txtEmail.text {
            if let password = txtPassword.text {
                Auth.auth().createUser(withEmail: email, password: password) { user, error in
                    if error == nil && user != nil {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print(error!.localizedDescription)
                    }
                }
            }
        }
    }
}
