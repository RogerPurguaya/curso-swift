//
//  ViewController.swift
//  AutosBill
//
//  Created by MAC01 on 11/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var Tabla: UITableView!
    
    var contenidoNum = ["1","2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tabla.dataSource = self
        Tabla.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoNum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "Celda")
        celda.textLabel?.text = contenidoNum[indexPath.row]
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idNumSeleccionado = indexPath.row
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: idNumSeleccionado)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDosSegue" {
   //         let idNumSeleccionadoRecibido = sender as! Int
            let objPantalla2:TableViewControllerNuevo = segue.destination as! TableViewControllerNuevo
            objPantalla2.arregloNumeros.append("6")
            //objPantalla2.nombreNumRecibido = contenidoNum[idNumSeleccionadoRecibido]
        }
    }

}
