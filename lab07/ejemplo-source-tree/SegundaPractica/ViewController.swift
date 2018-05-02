//
//  ViewController.swift
//  SegundaPractica
//
//  Created by MAC02 on 30/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnIngresar(_ sender: Any) {
        if txtUsuario.text == "tecsup" && txtPassword.text == "1234" {
            performSegue(withIdentifier: "segue1", sender: nil)
        }
        else{
            txtPassword.text = ""
            txtUsuario.text = ""
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

