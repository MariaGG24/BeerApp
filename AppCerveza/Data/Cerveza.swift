//
//  Cerveza.swift
//  AppCerveza
//
//  Created by María González García on 13/1/22.
//

import Foundation
import UIKit

public class Cerveza : Codable {
        
    var nombre : String
    var tipo : String
    var graduacion : Float
    var aporteCalorico : Float
    var logo : Data
    
    init (){
        self.nombre = ""
        self.tipo = ""
        self.graduacion = 0.0
        self.aporteCalorico = 0.0
        self.logo = Data()
    }
    
    init (_ n : String, _ t : String, _ g : Float, _ ac : Float, _ l : UIImage){
        self.nombre = n
        self.tipo = t
        self.graduacion = g
        self.aporteCalorico = ac
        self.logo = l.pngData()!
    }
        
    func getLogo() -> UIImage{
        return UIImage(data: self.logo)!
    }
    
    func setLogo(_ i : UIImage){
        self.logo = i.pngData()!
    }
}
