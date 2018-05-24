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
                //Mostramnos una alerta con un titulo de error y un mensaje:
                self.showAlert("Error.", "Usuario y/o contraseña incorrectos.")
            }else{
                print("Inicio de sesión exitoso")
                //Mostramnos una alerta con un titulo de exito y un mensaje:
                self.showAlert("Correcto.", "Inicio de sesión exitoso")
            }
        }
    }
    
    //boton registrarse:
    @IBAction func registrarTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "registrarsesegue", sender: nil)
    }
    
    //Creamos una función para mostrar las alertas (recibe como parámetros el título y el mensaje se la alerta)
    func showAlert (_ title: String,_ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //Si el título es un error nos mantenemos en la misma vista.
        if title == "Error." {
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        }else{
            //Si no hay error entonces llamamos al handler que nos redirecciona a la siguiente vista:
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: handlerView))
        }
        self.present(alert, animated: true)
    }
    
    //Función handler de las alertas para redireccionar a la siguiente view:
    func handlerView(alert: UIAlertAction!) {
        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
    }
    
}

