//
//  ShowViewController.swift
//  SegundaPractica
//
//  Created by MAC02 on 30/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
      var curso:[Cursos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNuevo(_ sender: Any) {
        performSegue(withIdentifier: "insertSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curso.count
    }
    
    func obtenerCursos(){
        let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            curso = try context.fetch(Cursos.fetchRequest()) as! [Cursos]
        }catch{
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cursos = curso[indexPath.row]
        performSegue(withIdentifier: "SegueModificar", sender: cursos)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueModificar" {
            let siguienteVC = segue.destination as! EditarViewController
            siguienteVC.curso = sender as! Cursos
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let borrarCursos = curso[indexPath.row]
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(borrarCursos)
            curso.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        } else if editingStyle == .insert {
            tableView.reloadData()
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let cursos = curso[indexPath.row]
        
        var prom1:Double = ((cursos.primera + cursos.segunda + cursos.tercera + cursos.cuarta) / 4) * 0.3
        var prom2:Double = (cursos.lab) * 0.6
        var prom3:Double = (cursos.examen) * 0.1
        
        let promedio:Double = prom1 + prom2 + prom3
        
        if promedio > 12 {
            cell.textLabel?.text = cursos.nombre
            cell.backgroundColor = UIColor.yellow
        }else{
            cell.textLabel?.text = cursos.nombre
            cell.backgroundColor = UIColor.orange
        }
        
        return cell

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
