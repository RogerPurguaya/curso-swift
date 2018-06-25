//
//  ViewControllerAgregar.swift
//  JSONRESTful
//
//  Created by MAC05 on 11/06/18.
//  Copyright © 2018 MAC05. All rights reserved.
//

import UIKit

class ViewControllerAgregar: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtGenero: UITextField!
    @IBOutlet weak var txtDuracion: UITextField!
    
    @IBOutlet weak var botonGuardar: UIButton!
    @IBOutlet weak var botonActualizar: UIButton!
    var pelicula:Peliculas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if pelicula == nil{
            botonGuardar.isEnabled = true
            botonActualizar.isEnabled = false
        }else{
            botonActualizar.isEnabled = true
            botonGuardar.isEnabled = false
            txtNombre.text = pelicula!.nombre
            txtGenero.text = pelicula!.genero
            txtDuracion.text = pelicula!.duracion
        }
        // Do any additional setup after loading the view.
    }

    //boton de guardar:
    @IBAction func btnGuardar(_ sender: Any) {
        let nombre = txtNombre.text!
        let genero = txtGenero.text!
        let duracion = txtDuracion.text!
        let datos = ["usuarioId": 1, "nombre": "\(nombre)", "genero": "\(genero)", "duracion":"\(duracion)"] as Dictionary<String, Any>
        let ruta = "http://localhost:3000/peliculas"
        metodoPost(ruta: ruta,datos: datos)
        navigationController?.popViewController(animated: true)
    }
    
    //boton de actualizar:
    @IBAction func btnActualizar(_ sender: Any) {
        let nombre = txtNombre.text!
        let genero = txtGenero.text!
        let duracion = txtDuracion.text!
        let datos = ["usuarioId": 1, "nombre": "\(nombre)", "genero": "\(genero)", "duracion":"\(duracion)"] as Dictionary<String, Any>
        let ruta = "http://localhost:3000/peliculas/\(pelicula!.id)"
        metodoPut(ruta: ruta, datos: datos)
        navigationController?.popViewController(animated: true)
    }
    
    
    //funcion de metodo post:
    func metodoPost(ruta:String, datos:[String:Any]) {
        let url : URL = URL(string: ruta)!
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        let params = datos
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        catch{
            
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request, completionHandler:
        {(data,response,error) in
            if (data != nil)
            {
                do{
                    let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves)
                    print(dict)
                }
                catch{
                    
                }
            }
        })
        task.resume()
    }
    //metodo PUT
    func metodoPut(ruta:String, datos:[String:Any]){
        let url : URL = URL(string: ruta)!
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "PUT"
        let params = datos
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        catch{
            
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request, completionHandler:
        {(data,response,error) in
            if (data != nil)
            {
                do{
                    let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves)
                    print(dict)
                }
                catch{
                    
                }
            }
        })
        task.resume()
    }

}
