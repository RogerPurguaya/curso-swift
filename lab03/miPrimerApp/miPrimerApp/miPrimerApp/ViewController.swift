//
//  ViewController.swift
//  miPrimerApp
//
//  Created by MAC02 on 3/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Se activó la funcionalidad ViewDidLoad del View Controller en la pantalla 1")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("Se activó la funcionalidad didReceiveMemoryWarning del View Controller en la pantalla 1")

    }
    override func loadView() {
        super.loadView()
        print("Se activó la funcionalidad loadView del View Controller en la pantalla 1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Se activó la funcionalidad viewWillAppear del View Controller en la pantalla 1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Se activó la funcionalidad viewDidAppear del View Controller en la pantalla 1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("Se activó la funcionalidad viewWillDisappear del View Controller en la pantalla 1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("Se activó la funcionalidad viewDidDisappear del View Controller en la pantalla 1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    


}

