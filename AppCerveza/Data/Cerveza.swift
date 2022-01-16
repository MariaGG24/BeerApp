//
//  Cerveza.swift
//  AppCerveza
//
//  Created by María González García on 13/1/22.
//

import Foundation
import UIKit

//public class Cerveza : NSObject, NSCoding, NSSecureCoding, Encodable {
public class Cerveza : Codable {
    
//    public static var supportsSecureCoding: Bool = true
    
    var nombre : String
    var tipo : String
    var graduacion : Float
    var aporteCalorico : Float
    var logo : UIImage
    
    enum CodingKeys : String, CodingKey {
        case nombre
        case tipo
        case graduacion
        case aporteCalorico
        case logo
    }
    
    required public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nombre = try container.decode(String.self, forKey: .nombre)
        tipo = try container.decode(String.self, forKey: .tipo)
        graduacion = try container.decode(Float.self, forKey: .graduacion)
        aporteCalorico = try container.decode(Float.self, forKey: .aporteCalorico)
        logo = try container.decode(UIImage.self, forKey: .logo)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(tipo, forKey: .tipo)
        try container.encode(graduacion, forKey: .graduacion)
        try container.encode(aporteCalorico, forKey: .aporteCalorico)
        try container.encode(logo, forKey: .logo)
    }
   /*
    override init() {
        self.nombre = "cerveza"
        self.tipo = "Negra"
        self.graduacion = 0.0
        self.aporteCalorico = 0.0
        self.logo = nil //--> Añadir foto por defecto
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre, forKey: "nombre")
        aCoder.encode(tipo, forKey: "tipo")
        aCoder.encode(graduacion, forKey: "graduacion")
        aCoder.encode(aporteCalorico, forKey: "aporteCalorico")
        aCoder.encode(logo, forKey: "logo")
    }
    
    public required init? (coder aDecoder: NSCoder) {
        self.nombre = aDecoder.decodeObject(forKey: "nombre") as! String
        self.tipo = aDecoder.decodeObject(forKey: "tipo") as! String
        self.graduacion = aDecoder.decodeObject(forKey: "graduacion") as! Float
        self.aporteCalorico = aDecoder.decodeObject(forKey: "aporteCalorico") as! Float
        self.logo = aDecoder.decodeObject(forKey: "logo") as! UIImage?
    }*/
}
