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
    
     var chica:Chicas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.text = chica?.nombre
        localized_name.text = chica?.descripcion
        primary_attr.text = chica?.estado
        attack_type.text = chica?.tipo
        base_health.text = chica?.fecha
       
        // descargar imagen
        //let ruta = "https://api.opendota.com"
        let url = URL(string: (chica?.imagen)!)
        let data = try? Data(contentsOf: url!)
        imagen.image = UIImage(data: data!)
        // Do any additional setup after loading the view.
    }

}
