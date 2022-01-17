//
//  SceneDelegate.swift
//  AppCerveza
//
//  Created by María González García on 17/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let bmv = BeerMakersView()
    let ficheroNacionales = "/fabNacionales.json"
    let ficheroExtranjeros = "/fabExtranjeros.json"

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        cargarDatos()
        window?.rootViewController = bmv
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        guardarDatos()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        cargarDatos()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        guardarDatos()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        cargarDatos()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        guardarDatos()
    }

    func cargarDatos() {
        let decoder = JSONDecoder()
        let fm = FileManager.default
        var urlCarpetaDatos = documentsURL().appendingPathComponent(ficheroNacionales)
        
        if fm.fileExists(atPath: urlCarpetaDatos.path)
        {
            do
            {
                let datos = try Data(contentsOf: urlCarpetaDatos)
                bmv.fabricantesNacionales = try decoder.decode([Fabricante].self, from: datos)
            } catch {
                print ("ERROR: al cargar los datos de los ficheros JSON.\n")
            }
        }
        
        urlCarpetaDatos = documentsURL().appendingPathComponent(ficheroExtranjeros)
        if fm.fileExists(atPath: urlCarpetaDatos.path)
        {
            do
            {
                let datos = try Data(contentsOf: urlCarpetaDatos)
                bmv.fabricantesExtranjeros = try decoder.decode([Fabricante].self, from: datos)
            } catch {
                print ("ERROR: al cargar los datos de los ficheros JSON.\n")
            }
        }
        
        if bmv.fabricantesNacionales.isEmpty && bmv.fabricantesExtranjeros.isEmpty
        {
            crearDatosIniciales()
        }
    }

    func guardarDatos() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let urlNacionales = documentsURL().appendingPathComponent(ficheroNacionales)
        let urlExtranjeros = documentsURL().appendingPathComponent(ficheroExtranjeros)
        
        do {
            let datosNacionales = try encoder.encode(bmv.fabricantesNacionales)
            let datosExtranjeros = try encoder.encode(bmv.fabricantesExtranjeros)
            
            try datosNacionales.write(to: urlNacionales)
            try datosExtranjeros.write(to: urlExtranjeros)
            
        } catch {
            print ("ERROR: al guardar los datos en los ficheros JSON.\n")
        }
    }
    
    func crearDatosIniciales() {
        let nombres = ["Mahou", "Estrella Galicia", "Heineken", "Leffe", "Estrella Damm", "Bavaria"]
        let paises = ["España", "España", "Países Bajos", "Bélgica", "España", "Colombia"]
        
        for i in 0..<nombres.count {
            let fabricante = Fabricante()
            fabricante.nombre = nombres[i]
            fabricante.pais = paises[i]
            fabricante.cervezas = insertarCervezas(fabricante.nombre)
            
            if fabricante.pais == "España"
            {
                bmv.fabricantesNacionales.append(fabricante)
            }
            else
            {
                bmv.fabricantesExtranjeros.append(fabricante)
            }
        }
    }

    public func insertarCervezas(_ fab : String) -> [Cerveza] {
        var cerv = [Cerveza]()
        
        if fab == "Mahou"
        {
            let c = Cerveza()
            c.nombre = "Mahou Maestra"
            c.aporteCalorico = 67.0
            c.graduacion = 7.5
            c.tipo = "Doppelock"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Mahou Mixta"
            c1.aporteCalorico = 29.0
            c1.graduacion = 0.9
            c1.tipo = "Radler"
            cerv.append(c1)
        }
        else if fab == "Estrella Galicia"
        {
            let c = Cerveza()
            c.nombre = "Estrella Galicia Especial"
            c.aporteCalorico = 47.0
            c.graduacion = 5.5
            c.tipo = "Lager Especial"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Estrella del Camino"
            c1.aporteCalorico = 46.0
            c1.graduacion = 5.3
            c1.tipo = "WITBIER"
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Estrella Galicia 00 Tostada"
            c2.aporteCalorico = 24.0
            c2.graduacion = 0.0
            c2.tipo = "Sin Alcohol"
            cerv.append(c2)
        }
        else if fab == "Heineken"
        {
            let c = Cerveza()
            c.nombre = "Heineken Original"
            c.aporteCalorico = 42.0
            c.graduacion = 5.0
            c.tipo = "Lager Pilsen Premium"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Heineken 0.0"
            c1.aporteCalorico = 21.0
            c1.graduacion = 0.0
            c1.tipo = "Sin Alcohol"
            cerv.append(c1)
        }
        else if fab == "Leffe"
        {
            let c = Cerveza()
            c.nombre = "Leffe Blonde"
            c.aporteCalorico = 42.0
            c.graduacion = 6.6
            c.tipo = "Pale Ale"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Leffe Ruby"
            c1.aporteCalorico = 55.0
            c1.graduacion = 5.0
            c1.tipo = "Lambic"
            cerv.append(c1)
        }
        else if fab == "Estrella Damm"
        {
            let c = Cerveza()
            c.nombre = "Voll-Damm"
            c.aporteCalorico = 66.0
            c.graduacion = 7.2
            c.tipo = "Märzenbier"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Equilater"
            c1.aporteCalorico = 75.0
            c1.graduacion = 11.0
            c1.tipo = "Imperial Stout"
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Malquerida"
            c2.aporteCalorico = 45.0
            c2.graduacion = 5.0
            c2.tipo = "Lager"
            cerv.append(c2)
        }
        else
        {
            let c = Cerveza()
            c.nombre = "Corona Extra"
            c.aporteCalorico = 42.0
            c.graduacion = 4.5
            c.tipo = "Lager"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Budweiser"
            c1.aporteCalorico = 43.0
            c1.graduacion = 5.0
            c1.tipo = "Lager"
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Poker"
            c2.aporteCalorico = 142.0
            c2.graduacion = 4.0
            c2.tipo = "Lager"
            cerv.append(c2)
        }
        return cerv
    }
}
