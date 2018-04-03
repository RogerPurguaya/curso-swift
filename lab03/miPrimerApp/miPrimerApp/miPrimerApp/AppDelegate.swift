//
//  AppDelegate.swift
//  miPrimerApp
//
//  Created by MAC02 on 3/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("Se activó la funció application del AppDelegate")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Se activó la función applicationWillResignActive del AppDelegate")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Se activó la función application del AppDelegate")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Se activó la función applicationDidEnterBackground del AppDelegate")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Se activó la función applicationDidBecomeActive del AppDelegate")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Se activó la función applicationWillTerminate del AppDelegate")
    }


}

