//
//  AppDelegate.swift
//  Todoey
//
//  Created by Tejumola David on 7/24/18.
//  Copyright © 2018 Tejumola David. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do{
             _ = try Realm()
        }catch{
            print("Error initailizing this bastard\(error)")
        }
        
        return true
    }

}

