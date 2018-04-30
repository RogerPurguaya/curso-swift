//
//  ViewController2.swift
//  calculadora
//
//  Created by MAC02 on 26/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    
    @IBOutlet weak var lblResultado: UILabel!

    var resultado:Float=0
    var numero:Float=0
    var operacion:String="="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operacion="="
        lblResultado.text=("\(resultado)")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnNumero(_ sender: UIButton) {
        
        numero = numero * 10 + Float(Int(sender.titleLabel!.text!)!)
        lblResultado.text=("\(numero)")
    }
    
    
    
    
    @IBAction func btnOperacion(_ sender: UIButton) {
        switch operacion {
        case "=":
            resultado=numero
        case "+":
            resultado=resultado+numero
        case "-":
            resultado=resultado-numero
        case "X":
            resultado=resultado*numero
        case "/":
            resultado=resultado/numero
        case "/":
            resultado=resultado/numero
        case "¬2":
            resultado=pow(numero, 2)
        case"2√":
            resultado=pow(numero, 1/2)
        case "sin":
            resultado=sin(numero)
        case "cos":
            resultado=cos(numero)
        default:
            print("Error")
        }
        
        numero=0
        lblResultado.text=("\(resultado)")
        
        if(sender.titleLabel!.text == "="){
            resultado=0
        }
        operacion = sender.titleLabel!.text! as String!
        
    }
    
    
    @IBAction func btnLimpiar(_ sender: UIButton) {
        resultado=0
        numero=0
        operacion="="
        lblResultado.text=("\(resultado)")
    }
    

}
