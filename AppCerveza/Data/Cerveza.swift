//
//  Cerveza.swift
//  AppCerveza
//
//  Created by María González García on 13/1/22.
//

import Foundation
import UIKit

//public class Cerveza : NSObject, NSCoding, NSSecureCoding, Encodable {
public class Cerveza {
    
    public static var supportsSecureCoding: Bool = true
    
    var nombre:String
    var tipo:String
    var graduacion:Float
    var aporteCalorico:Float
    var logo:UIImage?
    
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
