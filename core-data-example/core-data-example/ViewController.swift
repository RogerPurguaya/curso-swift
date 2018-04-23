//
//  ViewController.swift
//  core-data-example
//
//  Created by MAC02 on 18/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Persona", in: context)
        let newPersona = NSManagedObject(entity: entity!, insertInto: context)
        
        newPersona.setValue("0001", forKey: "id")
        newPersona.setValue("Otro usuario", forKey: "nombre")
    
        do {
            
            try context.save()
            print("Guardado con éxito")
            
        } catch {
            
            print("Error en el guardado")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Persona")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "id") as! String)
                print(data.value(forKey: "nombre") as! String)
            }
            
        } catch {
            
            print("Error")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

