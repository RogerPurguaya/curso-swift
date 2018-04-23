//
//  ViewController.swift
//  Tareas
//
//  Created by MAC12 on 23/04/18.
//  Copyright © 2018 MAC12. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tareas:[Tarea] = []
    var indexSeleccionado:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tareas = crearTareas()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ UITableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        if tarea.importante {
            cell.textLabel?.text = "😱\(tarea.nombre!)"
        }else{
            cell.textLabel?.text = "😎\(tarea.nombre!)"
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    
//    Para el segundo segue:
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
        
    }
    
    
    /*func crearTareas() -> [Tarea] {
        let tarea1 = Tarea()
        tarea1.nombre = "Estudiar para el examen"
        tarea1.importante = false
        
        let tarea2 = Tarea()
        tarea2.nombre = "Hacer los labs que debo"
        tarea2.importante = true
        
        let tarea3 = Tarea()
        tarea3.nombre = "Estudiar para subsa :("
        tarea3.importante = false
        
        return [tarea1,tarea2,tarea3]
    }*/
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerTareas() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tareas = try context.fetch(Tarea.fetchRequest()) as![Tarea]
        } catch {
            print ("Ha ocurrido un error")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*let siguienteVC = segue.destination as! CrearTareaViewController
        siguienteVC.anteriorVC = self*/
        
        /*if segue.identifier == "agregarSegue" {
            let siguienteVC = segue.destination as! CrearTareaViewController
            siguienteVC.anteriorVC = self
        }*/
        if segue.identifier == "tareaSeleccionadaSegue" {
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as! Tarea
            siguienteVC.anteriorVC = self
        }
    }
    
    
   

}

