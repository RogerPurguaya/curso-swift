//
//  ViewController.swift
//  UsodeControlesBill
//
//  Created by MAC01 on 16/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblRespuesta: UILabel!
    @IBOutlet weak var txtNumero2: UITextField!
    @IBOutlet weak var txtNumero1: UITextField!
    
    var nro1:Double = 0
    var nro2:Double = 0
    var res:Double = 0
    var lim:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnSumar(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 + nro2
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
    }
}
    @IBAction func btnResta(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 - nro2
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func btnMul(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 * nro2
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func btnDiv(_ sender: UIButton) {
        if txtNumero1.text != "" || txtNumero2.text != "" {
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            res = nro1 / nro2
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func btnLim(_ sender: UIButton) {
            lblRespuesta.text = String(" ")
    }
}
