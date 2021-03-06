//
//  ViewController.swift
//  JSONRESTful
//
//  Created by MAC05 on 11/06/18.
//  Copyright © 2018 MAC05. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    var users = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validarUsuario (ruta: String , completed: @escaping () -> ()) {
        let url = URL(string: ruta)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.users = try JSONDecoder().decode([Users].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("Error en json")
                }
            }
            }.resume()
    }
    
    
    @IBAction func ingresarTapped(_ sender: Any) {
        let ruta = "http://localhost:3000/usuarios?"
        let usuario = txtUsuario.text!
        let contrasena = txtContrasena.text!
        let url = ruta + "nombre=\(usuario)&clave=\(contrasena)"
        let crearURL = url.replacingOccurrences(of: " ", with: "%20")
        validarUsuario(ruta: crearURL) {
            if self.users.count <= 0 {
                print("Nombre o contraseña incorrectos")
            }else {
                print("Logeo exitoso!")
                self.performSegue(withIdentifier: "segueLogeo", sender: nil)
                for data in self.users {
                    print("id: \(data.id) , nombre: \(data.nombre) , email: \(data.email)")
                }
            }
            
        }
    }
    
    


}

