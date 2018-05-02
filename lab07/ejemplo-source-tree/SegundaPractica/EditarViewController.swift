//
//  EditarViewController.swift
//  SegundaPractica
//
//  Created by MAC02 on 30/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class EditarViewController: UIViewController {

    @IBOutlet weak var txtPrimera: UITextField!
    
    @IBOutlet weak var txtSegunda: UITextField!
    
    @IBOutlet weak var txtTercera: UITextField!
    
    @IBOutlet weak var txtCuarta: UITextField!
    
    @IBOutlet weak var txtLab: UITextField!
    
    @IBOutlet weak var txtExamen: UITextField!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    var curso:Cursos? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNombre.text = String(curso!.nombre!)
        txtPrimera.text = "\(curso!.primera)"
        txtSegunda.text = "\(curso!.segunda)"
        txtTercera.text = "\(curso!.tercera)"
        txtCuarta.text = "\(curso!.cuarta)"
        txtLab.text = "\(curso!.lab)"
        txtExamen.text = "\(curso!.examen)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Cursos(context: context)
        
        curso.nombre = txtNombre.text!
        curso.primera = Double(txtPrimera.text!)!
        curso.segunda = Double(txtSegunda.text!)!
        curso.tercera = Double(txtTercera.text!)!
        curso.cuarta = Double(txtCuarta.text!)!
        curso.lab = Double(txtLab.text!)!
        curso.examen = Double(txtExamen.text!)!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
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
