//
//  Fabricante.swift
//  AppCerveza
//
//  Created by María González García on 14/1/22.
//

import Foundation
import UIKit

//public class Fabricante : NSObject, NSCoding, NSSecureCoding, Encodable, Decodable {
public class Fabricante : Codable {
    
//    public static var supportsSecureCoding: Bool = true
    
    var nombre = String()
    var pais = String()
    var cervezas = [Cerveza]()
    var logo = UIImage()
    
    
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
}
