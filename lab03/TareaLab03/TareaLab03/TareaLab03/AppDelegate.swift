//
//  AppDelegate.swift
//  TareaLab03
//
//  Created by MAC02 on 3/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("Se activo la funcion application del Appdelegate")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Se ha salido de la aplicación")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Se ingresó a la pantalla de inicio de la aplicacion")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Se ingresó a la aplicación")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("La aplición ¡se encuentra en modo activo")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("La aplicación ha finalizado")
    }


}

