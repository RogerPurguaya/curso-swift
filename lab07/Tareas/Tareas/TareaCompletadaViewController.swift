//
//  TareaCompletadaViewController.swift
//  Tareas
//
//  Created by MAC02 on 23/04/18.
//  Copyright © 2018 MAC12. All rights reserved.
//

import UIKit

class TareaCompletadaViewController: UIViewController {
    
    var anteriorVC = ViewController()
    
    @IBOutlet weak var tareaLabel: UILabel!
    
    var tarea = Tarea()
    @IBAction func completarTarea(_ sender: Any) {
        anteriorVC.tareas.remove(at: anteriorVC.indexSeleccionado)
        anteriorVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if tarea.importante {
          tareaLabel.text =  "😢\(tarea.nombre)"
        }
        else{
            tareaLabel.text =  tarea.nombre
        }
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
