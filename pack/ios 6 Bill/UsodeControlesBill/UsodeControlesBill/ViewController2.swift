//
//  ViewController2.swift
//  UsodeControlesBill
//
//  Created by MAC01 on 16/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var controlSegmento: UISegmentedControl!

    @IBOutlet weak var txtNumero1: UITextField!
    @IBOutlet weak var txtNumero2: UITextField!
    
    @IBOutlet weak var lblRespuesta: UILabel!
    var nro1:Double = 0
    var nro2:Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func elegirSegmento(_ sender: Any) {
        
        nro1 = Double(txtNumero1.text!)!
        nro2 = Double(txtNumero2.text!)!
        
        let opcion = controlSegmento.selectedSegmentIndex
        switch opcion {
        case 0:
            lblRespuesta.text = operacion(n1: nro1, n2: nro2, op: "+")
        case 1:
            lblRespuesta.text = operacion(n1: nro1, n2: nro2, op: "-")
        case 2:
            lblRespuesta.text = operacion(n1: nro1, n2: nro2, op: "*")
        case 3:
            lblRespuesta.text = operacion(n1: nro1, n2: nro2, op: "/")
        default:
            lblRespuesta.text = "Error"
        }
    }

    func operacion(n1:Double, n2:Double, op:String) -> String{
        switch op {
        case "+":
            return String(n1 + n2)
        case "-":
            return String(n1 - n2)
        case "*":
            return String(n1 * n2)
        case "/":
            return String(n1 / n2)
        default:
            return "Error"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
