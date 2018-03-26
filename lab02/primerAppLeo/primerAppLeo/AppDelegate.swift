//
//  AppDelegate.swift
//  primerAppLeo
//
//  Created by MAC02 on 26/03/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("Se activo la funcion application del AppDelegate")
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("Se activo la funcion applicationWillResignActive del AppDelegate")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Se activo la funcion applicationDisEnterBackground del AppDelegate")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Se activo la funcion applicationWillEnterForeground del AppDelegate")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Se activo la funcion applicationDidBecomeActive del AppDelegate")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("Se activo la funcion applicationWillTerminate del AppDelegate")
    }
    
    
}
