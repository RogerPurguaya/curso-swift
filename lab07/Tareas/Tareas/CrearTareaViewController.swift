//
//  CrearTareaViewController.swift
//  Tareas
//
//  Created by MAC02 on 23/04/18.
//  Copyright © 2018 MAC12. All rights reserved.
//

import UIKit

class CrearTareaViewController: UIViewController {
    @IBOutlet weak var txtNombreArea: UITextField!

    @IBOutlet weak var swImportante: UISwitch!
    
    //var anteriorVC = ViewController()
    
    @IBAction func agregar(_ sender: Any) {
        //let tarea =  Tarea()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context)
        tarea.nombre = txtNombreArea.text!
        tarea.importante = swImportante.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        /*anteriorVC.tareas.append(tarea)
        anteriorVC.tableView.reloadData()*/
        navigationController!.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
