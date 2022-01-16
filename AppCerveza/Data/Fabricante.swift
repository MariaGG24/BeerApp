//
//  Fabricante.swift
//  AppCerveza
//
//  Created by María González García on 16/1/22.
//

import Foundation
import UIKit

public class Fabricante : Codable {
    
    var nombre : String
    var pais : String
    var cervezas : [Cerveza]
    var logo : UIImage
    
    enum CodingKeys : String, CodingKey {
        case nombre
        case pais
        case cervezas
        case logo
    }
    
    required public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nombre = try container.decode(String.self, forKey: .nombre)
        pais = try container.decode(String.self, forKey: .pais)
        cervezas = try container.decode([Cerveza].self, forKey: .cervezas)
        logo = try container.decode(UIImage.self, forKey: .logo)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(pais, forKey: .pais)
        try container.encode(cervezas, forKey: .cervezas)
        try container.encode(logo, forKey: .logo)
    }
}
/*
var description:String {
return "{ nombre: \(nombre), pais: \(pais) }"
}
*/
/*
 override init() {
    self.nombre = "fabricante"
    self.pais = "España"
    self.cervezas = nil
    self.logo = nil
}
    
public func encode(with aCoder: NSCoder) {
    aCoder.encode(nombre, forKey: "nombre")
    aCoder.encode(pais, forKey: "pais")
    aCoder.encode(cervezas, forKey: "cervezas")
    aCoder.encode(logo, forKey: "logo")
}

public required init? (coder aDecoder: NSCoder) {
    self.nombre = aDecoder.decodeObject(forKey: "nombre") as! String
    self.pais = aDecoder.decodeObject(forKey: "pais") as! String
    self.cervezas = aDecoder.decodeObject(forKey: "graduacion") as! [Cerveza]?
    self.logo = aDecoder.decodeObject(forKey: "logo") as! UIImage?
}*/
