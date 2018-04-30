//
//  ViewController.swift
//  calculadora
//
//  Created by MAC02 on 19/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numeroDePantalla:Double = 0
    var numeroAnterior:Double = 0
    var opeMath = false
    var operador = ""
    
    @IBOutlet weak var lblResultado: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numeros(_ sender: UIButton) {
        lblResultado.text = lblResultado.text! + String((sender as AnyObject).tag - 1)
        numeroDePantalla = Double(lblResultado.text!)!
    }
    
    

    @IBAction func operaciones(_ sender: UIButton) {
        print(sender.tag)
        if lblResultado.text != "" && sender.tag != 11 && sender.tag != 17 {
            
            numeroAnterior = Double(lblResultado.text!)!
            lblResultado.text = ""
            numeroDePantalla = 0
            
            if sender.tag == 13 {
                operador = "/"
            }
            else if sender.tag == 14{
                operador = "*"
            }
            else if sender.tag == 15{
                operador = "-"
            }
            else if sender.tag == 16{
                operador = "+"
            }
            
        }
        
        else if sender.tag == 17 {
            
            var res = ejecutaOperacion(numeroAnterior, numeroDePantalla, operador)
            
            lblResultado.text = String(res)
        }
        
        else if sender.tag == 11 {
            lblResultado.text = "0"
            numeroDePantalla  = 0
        }
        
    }
    
    func ejecutaOperacion(_ num1:Double,_ num2: Double,_ operador:String) -> Double {
        switch operador {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            return num1 / num2
        default:
            return 0
        }
    
    }
    
}

