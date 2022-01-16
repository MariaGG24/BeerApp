//
//  DataHandlers.swift
//  AppCerveza
//
//  Created by María González García on 16/1/22.
//

import Foundation

let bmv = BeerMakersView()
let ficheroNacionales = "/fabNacionales.json"
let ficheroExtranjeros = "/fabExtranjeros.json"

public func cargarDatos() {
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
}

public func guardarDatos() {
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
