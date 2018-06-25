//
//  Users.swift
//  JSONRESTful
//
//  Created by MAC05 on 11/06/18.
//  Copyright © 2018 MAC05. All rights reserved.
//

import Foundation

struct Users:Decodable {
    let id:Int
    let nombre:String
    let clave:String
    let email:String
}
