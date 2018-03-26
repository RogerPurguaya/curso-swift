//
//  ViewController.swift
//  miPrimerApp
//
//  Created by MAC02 on 26/03/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("se activo la funcion viewDidLoad del vc en la pantalla 1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("se activo la funcion didReceiveMemoryWarning del vc en la pantalla 1")
        
        // Dispose of any resources that can be recreated.
    }
    override func loadView() {
        super.loadView()
        print("se activo la funcion loadView del vc en la pantalla 1")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("se activo la funcion viewWillAppear del vc en la pantalla 1")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("se activo la funcion viewWillAppear del vc en la pantalla 1")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("se activo la funcion viewWillDisappear del vc en la pantalla 1")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("se activo la funcion viewDidDisappear del vc en la pantalla 1")
    }
    
    
    
}

