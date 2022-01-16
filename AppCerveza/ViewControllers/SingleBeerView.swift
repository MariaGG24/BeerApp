//
//  SingleBeerView.swift
//  AppCerveza
//
//  Created by María González García on 20/12/21.
//
// THIS IS THE MASTER BRANCH
//

import UIKit

class SingleBeerView : UIViewController {
    
    weak var bv = BeersView()
    var constraints = [NSLayoutConstraint]()
    var etiqueta = UILabel()
    var botonAtras = UIButton()
    var nombre = UILabel()
    var graduacion = UILabel()
    var aporteCalorico = UILabel()
    var t = String()
    var tipo = UILabel()
    var iV = UIImageView()
    var cervezas = [Cerveza]()
    var tipos = [String]()
    var seccion = Int()
    var fila = Int()
    var filasSec = [Int]()
    var cervezaElegida = Cerveza()
    
    override func loadView() {
        super.loadView()
        
        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
        view.backgroundColor = .white
        
        prepararElementosInformacion()
        prepararEtiqueta()
        prepararBoton()
        prepararConstraints()
        
        view.addSubview(etiqueta)
        view.addSubview(botonAtras)
        view.addSubview(nombre)
        view.addSubview(graduacion)
        view.addSubview(aporteCalorico)
        view.addSubview(tipo)
        view.addSubview(iV)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.text = "Información sobre " + cervezaElegida.nombre
        etiqueta.textColor = .systemBrown
        etiqueta.textAlignment = .center
        etiqueta.font = UIFont(name: "Chalkduster", size: 20.0)
    }
    
    func prepararBoton() {
        botonAtras.translatesAutoresizingMaskIntoConstraints = false
        botonAtras.setTitle("Atrás", for: .normal)
        botonAtras.setTitleColor(.blue, for: .normal)
        botonAtras.contentHorizontalAlignment = .center
        botonAtras.layer.cornerRadius = 4
        botonAtras.backgroundColor = .lightGray
        botonAtras.addTarget(self, action: #selector(SingleBeerView.atras), for: .touchUpInside)
    }
    
    func prepararElementosInformacion() {
        
        var pos = 0
        
        while cervezas[pos].tipo != tipos[seccion]
        {
            pos = pos + 1
        }
        pos = pos + fila
        cervezaElegida = cervezas[pos]
        
        nombre.translatesAutoresizingMaskIntoConstraints = false
        nombre.text = "Nombre de la Cerveza: " + cervezaElegida.nombre
        nombre.textAlignment = .center
        nombre.textColor = .systemBrown
        nombre.font = UIFont(name: "Chalkduster", size: 15.0)
        
        graduacion.translatesAutoresizingMaskIntoConstraints = false
        graduacion.text = "Graduación de la Cerveza: " + String(cervezaElegida.graduacion)
        graduacion.textAlignment = .center
        graduacion.textColor = .systemBrown
        graduacion.font = UIFont(name: "Chalkduster", size: 15.0)
        
        aporteCalorico.translatesAutoresizingMaskIntoConstraints = false
        aporteCalorico.text = "Aporte calórico de la Cerveza: " + String(cervezaElegida.aporteCalorico)
        aporteCalorico.textAlignment = .center
        aporteCalorico.textColor = .systemBrown
        aporteCalorico.font = UIFont(name: "Chalkduster", size: 15.0)
        
        tipo.translatesAutoresizingMaskIntoConstraints = false
        tipo.text = "Tipo de la Cerveza: " + cervezaElegida.tipo
        tipo.textAlignment = .center
        tipo.textColor = .systemBrown
        tipo.font = UIFont(name: "Chalkduster", size: 15.0)
        
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        iV.image = UIImage(named: "cerveza.jpg") //Añadir aquí nombre de la foto que coincida con el de la cerveza para la foto
        iV.contentMode = .scaleAspectFit
    }
    
    func prepararConstraints() {
        constraints.append(etiqueta.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constraints.append(etiqueta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108))
        constraints.append(etiqueta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108))
        
        constraints.append(nombre.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 30))
        constraints.append(nombre.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(graduacion.topAnchor.constraint(equalTo: nombre.bottomAnchor, constant: 20))
        constraints.append(graduacion.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(aporteCalorico.topAnchor.constraint(equalTo: graduacion.bottomAnchor, constant: 20))
        constraints.append(aporteCalorico.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(tipo.topAnchor.constraint(equalTo: aporteCalorico.bottomAnchor, constant: 20))
        constraints.append(tipo.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(iV.topAnchor.constraint(equalTo: tipo.bottomAnchor, constant: 20))
        constraints.append(iV.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(botonAtras.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonAtras.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
    }
    
    @objc func atras(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

