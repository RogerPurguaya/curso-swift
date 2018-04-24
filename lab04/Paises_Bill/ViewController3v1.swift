//
//  ViewController3v1.swift
//  Paises_Bill
//
//  Created by MAC01 on 10/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController3v1: UIViewController {

    @IBOutlet var vistaWeb: UIWebView!
    var nombreImgRecibido: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            mostrarImg()
            habilitarZoom()
    }
    func mostrarImg(){
        let direccionImg = URL(fileURLWithPath: Bundle.main.path(forResource: nombreImgRecibido!, ofType: "jpg", inDirectory: "destinos")!)
   
        let datosImg = try? Data(contentsOf: direccionImg)
        
        vistaWeb.load(datosImg!, mimeType: "application/jpg", textEncodingName: "utf-8", baseURL: direccionImg)
    }
    
    func habilitarZoom(){
        vistaWeb.scalesPageToFit = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
