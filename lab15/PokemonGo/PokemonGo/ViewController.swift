//
//  ViewController.swift
//  PokemonGo
//
//  Created by MAC02 on 18/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var ubicacion = CLLocationManager()
    var contActualizaciones = 0
    var pokemons:[Pokemon] = []
    var contPo = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ubicacion.delegate = self
        pokemons = obtenerPokemon()

        /*if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
            
        }else{
            ubicacion.requestWhenInUseAuthorization()
        }*/
        
        
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            setup()
            
        }else{
            ubicacion.requestWhenInUseAuthorization()
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        if contActualizaciones < 1 {
            let region = MKCoordinateRegionMakeWithDistance(ubicacion.location!.coordinate, 1000 , 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
            
        }else{
            ubicacion.stopUpdatingLocation()
        }
        
        //print("ubicación actualizada")
    }
    
    // centrar tapped :
    @IBAction func centrarTapped(_ sender: Any) {
        if let coord = ubicacion.location?.coordinate {
            let region = MKCoordinateRegionMakeWithDistance(coord, 1000, 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }
    }
    

    // map view:
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            let pinview = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
            pinview.image = UIImage(named: "player")
            var frame = pinview.frame
            frame.size.height = 50
            frame.size.width = 50
            pinview.frame = frame
            return pinview
        }
        
        let pinview = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        pinview.image = UIImage(named: "mew")
        let pokemon = (annotation as! PokePin).pokemon
        pinview.image = UIImage(named: pokemon.imagenNombre!)
        var frame = pinview.frame
        frame.size.height = 50
        frame.size.width = 50
        pinview.frame = frame
        return pinview
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
        if view.annotation is MKUserLocation {
            return
        }
        let region = MKCoordinateRegionMakeWithDistance((view.annotation?.coordinate)!, 200, 200)
        mapView.setRegion(region, animated: true)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
        if let coord = self.ubicacion.location?.coordinate {
            let pokemon = (view.annotation as! PokePin).pokemon
            if MKMapRectContainsPoint(mapView.visibleMapRect, MKMapPointForCoordinate(coord)){
                print("puede atrapar el pokemon")
                /*pokemon.atrapado = true
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                mapView.removeAnnotation(view.annotation!)
                //mensaje al atrapar el pokemon
                let alertaVC = UIAlertController(title: "Felicidades!!", message: "Atrapaste un \(pokemon.nombre!)", preferredStyle: .alert)
                
                let pokedexAccion = UIAlertAction(title: "Pokedex", style: .default, handler: {(accion) in
                    self.performSegue(withIdentifier: "pokedexSegue", sender: nil)
                })
                alertaVC.addAction(pokedexAccion)
                let okAccion = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertaVC.addAction(okAccion)
                self.present(alertaVC, animated: true, completion: nil) */
                
                
                //Mesnaje de atrapar
                if pokemon.atrapado == true {
                    let alertaVC = UIAlertController(title: "Ya tienes este pokemon !", message: "Atrapaste un \(pokemon.nombre!)", preferredStyle: .alert)
                    let pokedexAccion = UIAlertAction(title: "Atrapar", style: .default, handler: {(action) in
                        self.performSegue(withIdentifier: "pokedexSegue", sender: nil)})
                    alertaVC.addAction(pokedexAccion)
                    let okAccion = UIAlertAction(title: "No atrapar", style: .default, handler: nil)
                    alertaVC.addAction(okAccion)
                    self.present(alertaVC, animated: true, completion: nil)
                    let pokemon = (view.annotation as! PokePin).pokemon
                    pokemon.atrapado = true
                    //Inicio contador
                    pokemon.cont += 1
                    self.contPo = Int(pokemon.cont)
                    print("*************** \(self.contPo) atrapaste un \(pokemon.nombre)")
                    //Fin contador
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    mapView.removeAnnotation(view.annotation!)
                } else if  pokemon.atrapado == false {
                    let alertaVC = UIAlertController(title: "Felicidades ! ", message: "has atrapado un \(pokemon.nombre!) !", preferredStyle: .alert)
                    let pokedexAccion = UIAlertAction(title: "Pokedex", style: .default, handler: {(action) in
                        self.performSegue(withIdentifier: "pokedexSegue", sender: nil)
                    })
                    let okAccion = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alertaVC.addAction(okAccion)
                    self.present(alertaVC, animated: true, completion: nil)
                    let pokemon = (view.annotation as! PokePin).pokemon
                    pokemon.atrapado = true
                    //Inicio contador
                    pokemon.cont += 1
                    self.contPo = Int(pokemon.cont)
                    print("*************** \(self.contPo) atrapaste un \(pokemon.nombre)")
                    //Fin contador
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    mapView.removeAnnotation(view.annotation!)
                }
            }else {
                let alertaVC = UIAlertController(title: "Opps!", message: "Estás muy lejos de ese  \(pokemon.nombre!)", preferredStyle: .alert)
                let okAccion = UIAlertAction(title: "OK", style: .default , handler: nil)
                alertaVC.addAction(okAccion)
                self.present(alertaVC, animated: true, completion: nil)
                print("no puede atrapar el pokemon")
            }
        }
        })
        //print("pin presionado !!")
    }
    
    
    //funcion setup:
    
    func setup () {
        mapView.delegate = self
        mapView.showsUserLocation = true
        ubicacion.startUpdatingLocation()
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
            
            if let coord = self.ubicacion.location?.coordinate{
                /*let pin = MKPointAnnotation()
                 pin.coordinate = coord*/
                
                let pokemon = self.pokemons[Int(arc4random_uniform(UInt32(self.pokemons.count)))]
                let pin = PokePin(coord: coord, pokemon: pokemon)
                
                let randomLat = (Double(arc4random_uniform(200))-100.0)/5000.0
                let randomLon = (Double(arc4random_uniform(200))-100.0)/5000.0
                pin .coordinate.latitude += randomLat
                pin.coordinate.longitude += randomLon
                
                self.mapView.addAnnotation(pin)
                
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            setup()
        }
    }
    
}

