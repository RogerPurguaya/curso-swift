//
//  ViewController.swift
//  TableView
//
//  Created by MAC02 on 24/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var Tabla: UITableView!
    
    var contenidoCeldas = ["pdf1","pdf2","pdf3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Tabla.dataSource = self
        Tabla.delegate = self
    }

    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCeldas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell
    {
        let celda = UITableViewCell(style:UITableViewCellStyle.default,  reuseIdentifier: "Celda")
        
        celda.textLabel?.text = contenidoCeldas[indexPath.row]
        
        return celda
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Hice click en la fila \(indexPath.row)")
        
        let idPdfSeleccionado = indexPath.row
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: idPdfSeleccionado)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDosSegue" {
            let idPdfSeleccionadoRecibido = sender as! Int
            let objPantalla2:ViewController2 = segue.destination as! ViewController2
            objPantalla2.pdfRecibido = contenidoCeldas[idPdfSeleccionadoRecibido]
        }
    }

}

