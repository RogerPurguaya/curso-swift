//
//  RegistarUsuarioViewController.swift
//  Snapchat
//
//  Created by MAC02 on 24/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistarUsuarioViewController: UIViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Función para mostrar alertas
    func showAlert (_ title: String,_ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if title == "Error." {
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        }else{
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: handlerView))
        }
        
        self.present(alert, animated: true)
    }
    //manejador de alertas
    func handlerView(alert: UIAlertAction!) {
        self.performSegue(withIdentifier: "iniciarsesionsegue2", sender: nil)
    }
    
    //oulet de action para el boton registrar
    @IBAction func registrarTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.txtUser.text!, password: self.txtPassword.text!, completion: {(user, error) in
            print("intentando crear usuario")
            if error != nil{
                self.showAlert("Error.", "Email incorrecto y/o password menor a 6 caracteres.")
            }else{
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                self.showAlert("Guardado.", "El usuario fue registrado correctamente.")
            }
        }
        )
    }
    
    
    
}
