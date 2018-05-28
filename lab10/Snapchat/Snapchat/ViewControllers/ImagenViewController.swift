//
//  ImagenViewController.swift
//  Snapchat
//
//  Created by MAC11 on 21/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class ImagenViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descripcionTextField: UITextField!
    
    @IBOutlet weak var elegirContactoBoton: UIButton!
    var imagePicker = UIImagePickerController()
    var imagenID =  NSUUID().uuidString
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        elegirContactoBoton.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        elegirContactoBoton.isEnabled = true
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func camaraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func mediaTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    @IBAction func elegirContactoTapped(_ sender: Any) {
        //performSegue(withIdentifier: "seleccionarContactoSegue", sender: nil)
        elegirContactoBoton.isEnabled = false
        let imagenesFolder = Storage.storage().reference().child("imagenes")
        let imagenData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        let imagen = imagenesFolder.child("\(imagenID).jpg")
        imagen.putData(imagenData, metadata: nil) {(metadata, error) in
            if error != nil {
                self.mostrarAlerta(title: "Error", message: "Se Produjo un error al subior la imagen", action: "Cancelar")
                self.elegirContactoBoton.isEnabled = true
                //print("Ocurrió un error al subir la imagen. \(error)")
                return
            }else{
                imagen.downloadURL(completion: { (url, error) in
                    guard let enlaceURL = url else {
                        self.mostrarAlerta(title: "Error.", message: "Se produjo un error al obtener la imagen", action: "Cancelar")
                        self.elegirContactoBoton.isEnabled = true
                        return
                    }
                    
                    self.performSegue(withIdentifier: "seleccionarContactoSegue", sender: url?.absoluteString)
                })
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVC = segue.destination as! ElegirUsuarioViewController
        siguienteVC.imagenURL = sender as! String
        siguienteVC.descrip = descripcionTextField.text!
        siguienteVC.imagenID = imagenID
    }
    
    func mostrarAlerta (title: String, message: String, action: String){
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelok =  UIAlertAction(title: title, style: .default, handler: nil)
        alertaGuia.addAction(cancelok)
        present(alertaGuia, animated: true, completion: nil)
    }
    
    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/


}
