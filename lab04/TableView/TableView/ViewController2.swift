//
//  ViewController2.swift
//  TableView
//
//  Created by MAC02 on 24/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet var vistaWeb: UIWebView!
    
    var pdfRecibido: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        habilitarZoom()
        mostrarPdf()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func mostrarPdf(){
        let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: pdfRecibido!, ofType: "pdf", inDirectory: "PDF")!)
        let datosPDF = try? Data(contentsOf: direccionPdf)
        vistaWeb.load(datosPDF! , mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionPdf)
    }
    
    func habilitarZoom(){
        vistaWeb.scalesPageToFit = true
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
