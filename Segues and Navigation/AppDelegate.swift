//
//  AppDelegate.swift
//  UIControlsTests
//
//  Created by Ignacio Nieto Carvajal on 11/5/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

/*
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
 func applicationWillResignActive(_ application: UIApplication)
 func applicationDidEnterBackground(_ application: UIApplication)
 func applicationWillEnterForeground(_ application: UIApplication)
 func applicationDidBecomeActive(_ application: UIApplication)
 func applicationWillTerminate(_ application: UIApplication)
 
 // https://hackernoon.com/application-life-cycle-in-ios-12b6ba6af78b
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Punto de sobrescritura para la personalización después del inicio de la aplicación.
        
        // customize navigation bar
        UINavigationBar.appearance().barTintColor = UIColor(rgba: "#f5bb00")
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName: UIFont(name: "Courier", size: 16)!]
        UINavigationBar.appearance().tintColor = UIColor(rgba: "#BF3100")
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = nil
        UINavigationBar.appearance().setBackgroundImage(nil, for: .default)
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")!
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrow")!
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 5, vertical: 0), for: .default)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Se envía cuando la aplicación está a punto de pasar del estado activo al estado inactivo. Esto puede ocurrir para ciertos tipos de interrupciones temporales (como una llamada telefónica entrante o un mensaje SMS) o cuando el usuario abandona la aplicación y comienza la transición al estado de fondo.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        // Utilice este método para pausar las tareas en curso, deshabilitar los temporizadores e invalidar las devoluciones de llamadas de representación gráfica. Los juegos deben usar este método para pausar el juego.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // Utilice este método para liberar recursos compartidos, guardar datos de usuario, invalidar temporizadores y almacenar suficiente información de estado de la aplicación para restaurar su aplicación a su estado actual en caso de que se finalice más adelante.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        // Si su aplicación admite la ejecución en segundo plano, se llama a este método en lugar de applicationWillTerminate: cuando el usuario se cierra.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        // Llamado como parte de la transición desde el fondo al estado activo; Aquí puede deshacer muchos de los cambios realizados al ingresar el background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        // Reinicie las tareas que se pausaron (o aún no se iniciaron) mientras la aplicación estaba inactiva. Si la aplicación estaba anteriormente en segundo plano, opcionalmente actualice la interfaz de usuario.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Llamado cuando la aplicación está a punto de terminar. Guardar datos si es apropiado. Véase también applicationDidEnterBackground :.
    }


}

