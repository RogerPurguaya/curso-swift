//
//  ViewControllerShow.swift
//  RESTful
//
//  Created by MAC02 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewControllerShow: UIViewController {

    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var localized_name: UILabel!
    @IBOutlet weak var primary_attr: UILabel!
    @IBOutlet weak var attack_type: UILabel!
    @IBOutlet weak var base_health: UILabel!
    
     var heroe:Heroes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.text = heroe?.name
        localized_name.text = heroe?.localized_name
        primary_attr.text = heroe?.primary_attr
        attack_type.text = heroe?.attack_type
        base_health.text = "\((heroe?.base_health)!)"
       
        // descargar imagen
        let ruta = "https://api.opendota.com"
        let url = URL(string: ruta + (heroe?.img)!)
        let data = try? Data(contentsOf: url!)
        imagen.image = UIImage(data: data!)
        // Do any additional setup after loading the view.
    }

}
