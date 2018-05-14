//
//  ViewController.swift
//  Snapchat
//
//  Created by MAC02 on 14/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text! , password: passwordTextField.text!) {
            (user, error) in print("Intentando iniciar sesión")
            if error != nil {
                print("Se presentó 3el siguiente error: \(error)")
            }else{
                print("Inicio de sesión exitoso")
            }
        }
    }
    
}

