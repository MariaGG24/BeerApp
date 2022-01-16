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
    var creacion : Int
    var cervezas : [Cerveza]
    var logo : Data
    
    init(){
        self.nombre = "Sin nombre"
        self.pais = "Sin país"
        self.creacion = 1900
        self.cervezas = [Cerveza]()
        self.logo = Data()
    }
    
    init (_ n : String, _ p : String, _ a : Int, _ c : [Cerveza], _ l : UIImage){
        self.nombre = n
        self.pais = p
        self.creacion = a
        self.cervezas = c
        self.logo = l.pngData()!
    }
        
    func getLogo() -> UIImage{
        return UIImage(data: self.logo)!
    }
    
    func setLogo(_ i : UIImage){
        self.logo = i.pngData()!
    }
}
