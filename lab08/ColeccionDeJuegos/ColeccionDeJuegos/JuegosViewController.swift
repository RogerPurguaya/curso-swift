//
//  JuegosViewController.swift
//  ColeccionDeJuegos
//
//  Created by MAC02 on 2/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class JuegosViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var agregarActualizarBoton: UIButton!
    @IBOutlet weak var eliminarBoton: UIButton!
    @IBOutlet weak var juegoImageView: UIImageView!
    @IBOutlet weak var tituloTextView: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var txtCategoria: UILabel!
    @IBOutlet weak var textBox: UITextField!
    
    
    var imagePicker = UIImagePickerController()
    
    var juego:Juego? = nil
    
    //var categorias = ["colombianas","argentinas","mexicanas","peruanas","venezolanas"]
    var list = ["asd","as","xa","wxs"]

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        if juego != nil {
            juegoImageView.image = UIImage(data: (juego!.imagen!) as Data)
            tituloTextView.text = juego!.titulo
            agregarActualizarBoton.setTitle("Actualizar", for: .normal)
        }else{
            eliminarBoton.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    
    
    //parte de picker:
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        let titleRow = list[row]
        return titleRow
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textBox.text = list[row]
        dropDown.isHidden = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        dropDown.isHidden = false
        
    }
    
    //fin parte picker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagenSeleccionada = info[UIImagePickerControllerOriginalImage] as! UIImage
        juegoImageView.image = imagenSeleccionada
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:  true, completion: nil)
    }

    @IBAction func camaraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func agregarTapped(_ sender: Any) {
        if juego != nil {
            juego!.titulo = tituloTextView.text
            juego!.imagen = UIImagePNGRepresentation(juegoImageView.image!) as NSData?
            juego!.categoria = textBox.text
        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let juego = Juego(context: context)
            juego.titulo = tituloTextView.text
            juego.imagen = UIImagePNGRepresentation(juegoImageView.image!) as NSData?
            juego.categoria = textBox.text
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
    
    @IBAction func eliminarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(juego!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    

}
