//
//  ViewController2.swift
//  UsoDeControles
//
//  Created by MAC02 on 16/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var controlSegmento: UISegmentedControl!

    @IBOutlet weak var numero1: UITextField!
    
    @IBOutlet weak var numero2: UITextField!
    
    @IBOutlet weak var res: UILabel!
    
    var nro1:Double = 0
    var nro2:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func operacion(n1:Double, n2:Double, op:String ) -> String {
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
    
    @IBAction func elegirSegmento(_ sender: Any) {
        nro1 = Double(numero1.text!)!
        nro2 = Double(numero2.text!)!
        
        let opcion = controlSegmento.selectedSegmentIndex
        
        switch opcion {
        case 0:
            res.text = operacion(n1: nro1, n2: nro2, op: "+")
        case 1:
            res.text = operacion(n1: nro1, n2: nro2, op: "-")
        case 2:
            res.text = operacion(n1: nro1, n2: nro2, op: "*")
        case 3:
            res.text = operacion(n1: nro1, n2: nro2, op: "/")
        default:
            res.text = "Error"
        }
    }


}
