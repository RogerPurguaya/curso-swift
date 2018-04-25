//
//  ViewController2.swift
//  CalculadoraBill
//
//  Created by MAC01 on 19/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var lblRespuesta: UILabel!
    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    
    var nro1:Double = 0
    var nro2:Double = 0
    var res:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnRaiz(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = sqrt(Double(nro1))
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    
    @IBAction func potencia2(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = pow(nro1, 2)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func potenciaN(_ sender: UIButton) {
        if txtNum1.text != "" || txtNum2.text != ""{
            nro1 = Double(txtNum1.text!)!
            nro2 = Double(txtNum2.text!)!
            res = pow(nro1, nro2)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func pi(_ sender: UIButton) {
        if txtNum1.text != ""{
            nro1 = Double(txtNum1.text!)!
            res = 3.141516 * nro1
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "3.141516"
        }
    }
    @IBAction func seno(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = sin(nro1)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func cos(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = Darwin.cos(nro1)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func tan(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = Darwin.tan(nro1)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func log(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = Darwin.log(nro1)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func euler(_ sender: UIButton) {
        if txtNum1.text != ""{
            nro1 = Double(txtNum1.text!)!
            res = 2.71828 * nro1
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "2.71828"
        }
    }
    @IBAction func phi(_ sender: UIButton) {
        if txtNum1.text != ""{
            nro1 = Double(txtNum1.text!)!
            res = 1.61803 * nro1
            
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "1.61803"
        }
    }
    @IBAction func secante(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = 1/(Darwin.cos(nro1))
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func cotangente(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = (Darwin.cos(nro1))/(sin(nro1))
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func cosecante(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = 1/(Darwin.cos(nro1))
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func senoHiper(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = sinh(nro1)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func cosenoHiperbol(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = cosh(nro1)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    @IBAction func tangenteHiper(_ sender: UIButton) {
        if txtNum1.text != "" {
            nro1 = Double(txtNum1.text!)!
            res = tanh(nro1)
            lblRespuesta.text = String(res)
        }else{
            lblRespuesta.text = "Error :p"
        }
    }
    
}
