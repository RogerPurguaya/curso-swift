//
//  ViewController.swift
//  RESTful
//
//  Created by MAC02 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var tablaChicas: UITableView!
    
    var chicas = [Chicas]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaChicas.delegate = self
        tablaChicas.dataSource = self
        
        print(descargarJSON {
            print("Data JSON Correcta")
            self.tablaChicas.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func descargarJSON(completed: @escaping () -> ()){
        let url = URL(string: "http://localhost:8000/api/publicaciones")
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error == nil {
                do{
                    self.chicas = try JSONDecoder().decode([Chicas].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("Error en JSON")
                }
            }
            }.resume()
    }
    
    //table functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chicas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = chicas[indexPath.row].nombre
        
        //Descargar imagendel url
        let url = URL(string: chicas[indexPath.row].imagen)
        let data = try? Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetallesHeroe", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destino = segue.destination as? ViewControllerShow{
            destino.chica = chicas[(tablaChicas.indexPathForSelectedRow?.row)!]
        }
    }
    
}

