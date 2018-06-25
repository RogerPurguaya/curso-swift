//
//  viewControllerBuscar.swift
//  JSONRESTful
//
//  Created by MAC05 on 11/06/18.
//  Copyright © 2018 MAC05. All rights reserved.
//

import UIKit

class viewControllerBuscar: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtBuscar: UITextField!
    var peliculas = [Peliculas]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let ruta = "http://localhost:3000/peliculas/"
        cargarPeliculas(ruta: ruta) {
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cargarPeliculas (ruta: String , completed: @escaping () -> ()) {
        let url = URL(string: ruta)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.peliculas = try JSONDecoder().decode([Peliculas].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("Error en json")
                }
            }
            }.resume()
    }
    
    //boton de regresar:
    
    @IBAction func btnSalir(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //boton de buscar
    @IBAction func btnBuscar(_ sender: Any) {
        let ruta = "http://localhost:3000/peliculas?"
        let nombre = txtBuscar.text!
        let url = ruta + "nombre_like=\(nombre)"
        let crearURL = url.replacingOccurrences(of: " ", with: "%20")
        
        if nombre.isEmpty{
            let ruta = "http://localhost:3000/peliculas/"
            self.cargarPeliculas(ruta: ruta) {
                self.tableView.reloadData()
            }
        }else{
            cargarPeliculas(ruta: crearURL) {
                if self.peliculas.count <= 0{
                    self.mostrarAlerta(title: "Error", message: "No se encontraron coincidenias para : \(nombre)", action: "cancel")
                }else{
                    self.tableView.reloadData()
                }
            }
        }
    }
    //mostrar alertas:
    func mostrarAlerta(title: String, message: String, action: String){
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelok = UIAlertAction(title: action, style: .default, handler: nil)
        alertaGuia.addAction(cancelok)
        present(alertaGuia, animated: true, completion: nil)
    }
    
    
    
    //funciones de table view:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(peliculas[indexPath.row].nombre)"
        cell.detailTextLabel?.text = "Género: \(peliculas[indexPath.row].genero)  Duración: \(peliculas[indexPath.row].duracion)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pelicula = peliculas[indexPath.row]
        performSegue(withIdentifier: "segueEditar", sender: pelicula)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segueEditar"{
            let siguienteVc = segue.destination as! ViewControllerAgregar
            siguienteVc.pelicula = sender as? Peliculas
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let ruta = "http://localhost:3000/peliculas/"
        cargarPeliculas(ruta: ruta){
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            //obtenemos el id de la película a eliminar:
           let id_pelicula = peliculas[indexPath.row].id
           //Contatenamos con la ruta de nuestro servidor de prueba
           let route = "http://localhost:3000/peliculas/\(id_pelicula)"
            //llamamos a nuestro método delete pasándole la ruta construida:
            metodoDelete(ruta: route)
            //recargamos nuestra tabla llamando de  nuevo a las peliculas:
           let reload_route = "http://localhost:3000/peliculas/"
            cargarPeliculas(ruta: reload_route){
            self.tableView.reloadData()
            }
            
        }
        
    }
    
    // accion de eliminar:
    func metodoDelete(ruta:String) {
        //identificamos la ruta del elemmento a eliminar:
        let url : URL = URL(string: ruta)!
        //alistamos una petición http para esa url
        var request = URLRequest(url: url)
        let session = URLSession.shared
        //establecemos el método de la petición:
        request.httpMethod = "DELETE"
        //agregamos las cabeceras respectivas:
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request, completionHandler:
            {(data,response,error) in
                if (data != nil){
                    do{
                        print("eliminación exitosa !!")
                        print(data)
                    }
                    catch{ print("Ha ocurrido un error") }
                }
        })
        task.resume()
    }
}
