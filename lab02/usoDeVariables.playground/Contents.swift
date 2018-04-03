//: Playground - noun: a place where people can play

import UIKit

let hola:String = "mi primer playground "
let hola2:String = "Roger Purguaya Lazaro"
let regalo:String = "3"
let a:Double = 10.1
let b:Double = 2.5
let c:Int = 10
let d:Int = 2
let e:Character = "X"
let f:Bool = true
let suma = a + b

let resta = c - d
let division = a / Double(c)
var multiplicacion = b * Double(c)
let validaSuma = e=="X" ? suma : Double(resta)
multiplicacion = 12.5
let saludo = hola + hola2 + "su nota es \(suma) "
print(saludo)
let extras = saludo + " + un bono de " + regalo + " es " + (String(suma) + regalo)

print(extras)

