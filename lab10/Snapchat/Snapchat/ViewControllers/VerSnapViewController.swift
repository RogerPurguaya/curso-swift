//
//  VerSnapViewController.swift
//  Snapchat
//
//  Created by MAC02 on 28/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class VerSnapViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text? = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imagenURL))
        
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        Database.database().reference().child("usuarios").child((Auth.auth().currentUser?.uid)!).child("snaps").child(snap.id).removeValue()
        
        Storage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").delete {
            (error) in
            print("Se eliminó la imagen correctamente.")
        }
        }
    

    

}
