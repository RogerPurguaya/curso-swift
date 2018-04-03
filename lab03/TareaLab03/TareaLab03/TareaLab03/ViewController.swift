//
//  ViewController.swift
//  TareaLab03
//
//  Created by MAC02 on 3/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Se termino de cargar la vista en la memoria")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Se activo la funcion didReceiveMemoryWarning del view controller en la pantalla 1")
    }
    
    override func loadView() {
        super.loadView()
        print("Se ha cargado la vista")
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("La vista está a punto de aparecer")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Se han activado los hilos correspondientes a los procesos costosos")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("La vista está a punto de desaparecer.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("La vista ha desaparecido.")
    }
    
}

