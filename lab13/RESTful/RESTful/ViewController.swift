//
//  ViewController.swift
//  RESTful
//
//  Created by MAC02 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tablaHeroes: UITableView!
    
    var heroes = [Heroes]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaHeroes.delegate = self
        tablaHeroes.dataSource = self
        
        print(descargarJSON {
            print("Data JSON Correcta")
            self.tablaHeroes.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func descargarJSON(completed: @escaping () -> ()){
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error == nil {
                do{
                    self.heroes = try JSONDecoder().decode([Heroes].self, from: data!)
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
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = heroes[indexPath.row].localized_name
        
        //Descargar imagendel url
        let ruta = "https://api.opendota.com"
        let url = URL(string: ruta + heroes[indexPath.row].icon)
        let data = try? Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetallesHeroe", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destino = segue.destination as? ViewControllerShow{
            destino.heroe = heroes[(tablaHeroes.indexPathForSelectedRow?.row)!]
        }
    }
    
}

