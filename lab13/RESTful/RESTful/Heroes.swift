//
//  Heroes.swift
//  RESTful
//
//  Created by MAC02 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//


import Foundation
struct Heroes:Decodable {
    let name:String
    let localized_name:String
    let primary_attr:String
    let attack_type:String
    let img:String
    let base_health:Double
    let icon:String
}
