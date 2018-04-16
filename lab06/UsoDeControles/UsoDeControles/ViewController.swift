//
//  ViewController.swift
//  UsoDeControles
//
//  Created by MAC02 on 16/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var lblRespuesta: UILabel!
    @IBOutlet weak var txtNumero1: UITextField!
    @IBOutlet weak var txtNumero2: UITextField!
    
    var nro1:Double = 0
    var nro2:Double = 0
    var res:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dissmissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func btnSumar(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 + nro2
            lblRespuesta.text = String(res)
        }
        else{
            lblRespuesta.text = "Error"
        }
    }
    
    
    @IBAction func btnRestar(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 - nro2
            lblRespuesta.text = String(res)
        }
        else{
            lblRespuesta.text = "Error"
        }
    }
    
    @IBAction func btnMultiplicar(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 * nro2
            lblRespuesta.text = String(res)
        }
        else{
            lblRespuesta.text = "Error"
        }
    }
    
    @IBAction func btnDividir(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 / nro2
            lblRespuesta.text = String(res)
        }
        else{
            lblRespuesta.text = "Error"
        }
    }
    
    
    @IBAction func btnLimpiar(_ sender: UIButton) {
        txtNumero1.text = ""
        txtNumero2.text = ""
    }
    
    func dissmissKeyboard() {
        view.endEditing(true)
    }

}

