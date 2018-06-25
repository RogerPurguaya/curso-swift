//
//  Peliculas.swift
//  JSONRESTful
//
//  Created by MAC05 on 11/06/18.
//  Copyright © 2018 MAC05. All rights reserved.
//

import Foundation
struct Peliculas:Decodable {
    let usuarioId:Int
    let id:Int
    let nombre:String
    let genero:String
    let duracion:String
}
