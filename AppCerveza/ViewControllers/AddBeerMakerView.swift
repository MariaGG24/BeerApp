//
//  AddBeerMakerView.swift
//  AppCerveza
//
//  Created by María González García on 14/1/22.
//

import Foundation
import UIKit

class AddBeerMakerView : UIViewController {
    
    weak var bmv = BeerMakersView()
    var constraints = [NSLayoutConstraint]()
    var etiqueta = UILabel()
    var botonHecho = UIButton()
    var et = UILabel()
    var et2 = UILabel()
    var et3 = UILabel()
    var campoNombre = UITextField()
    var campoPais = UITextField()
    var campoAno = UITextField()
    
    override func loadView() {
        super.loadView()
        
        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
        view.backgroundColor = .white
        
        prepararEtiqueta()
        prepararBoton()
        prepararElementosAdicion()
        prepararConstraints()
        
        view.addSubview(etiqueta)
        view.addSubview(et)
        view.addSubview(et2)
        view.addSubview(et3)
        view.addSubview(campoPais)
        view.addSubview(campoNombre)
        view.addSubview(campoAno)
        view.addSubview(botonHecho)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.text = "Añada un nuevo fabricante"
        etiqueta.textColor = .systemBrown
        etiqueta.textAlignment = .center
        etiqueta.font = UIFont(name: "Chalkduster", size: 20.0)
    }
    
    func prepararBoton() {
        botonHecho.translatesAutoresizingMaskIntoConstraints = false
        botonHecho.setTitle("Hecho", for: .normal)
        botonHecho.setTitleColor(.blue, for: .normal)
        botonHecho.contentHorizontalAlignment = .center
        botonHecho.layer.cornerRadius = 4
        botonHecho.backgroundColor = .lightGray
        botonHecho.addTarget(self, action: #selector(AddBeerMakerView.hecho), for: .touchUpInside)
    }
    
    func prepararElementosAdicion() {
        et.translatesAutoresizingMaskIntoConstraints = false
        et.text = "Introduzca el nombre del nuevo fabricante: "
        et.font = UIFont(name: "Chalkduster", size: 10.0)
        et.textColor = .systemBrown
        et.textAlignment = .left
        
        et2.translatesAutoresizingMaskIntoConstraints = false
        et2.text = "Introduzca el país del nuevo fabricante: "
        et2.font = UIFont(name: "Chalkduster", size: 10.0)
        et2.textColor = .systemBrown
        et2.textAlignment = .left
        
        et3.translatesAutoresizingMaskIntoConstraints = false
        et3.text = "Introduzca el año de fundación del nuevo fabricante: "
        et3.font = UIFont(name: "Chalkduster", size: 10.0)
        et3.textColor = .systemBrown
        et3.textAlignment = .left
        
        campoNombre.translatesAutoresizingMaskIntoConstraints = false
        campoNombre.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoNombre.textAlignment = .right
        campoNombre.borderStyle = .roundedRect
        campoNombre.layer.borderWidth = 2
        campoNombre.placeholder = "Sin nombre"
        
        campoPais.translatesAutoresizingMaskIntoConstraints = false
        campoPais.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoPais.textAlignment = .right
        campoPais.borderStyle = .roundedRect
        campoPais.layer.borderWidth = 2
        campoPais.placeholder = "Sin país"
        
        campoAno.translatesAutoresizingMaskIntoConstraints = false
        campoAno.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoAno.textAlignment = .right
        campoAno.borderStyle = .roundedRect
        campoAno.layer.borderWidth = 2
        campoAno.placeholder = "1900"
    }
    
    func prepararConstraints() {
        constraints.append(etiqueta.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constraints.append(etiqueta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108))
        constraints.append(etiqueta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108))

        constraints.append(et.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 90))
        constraints.append(et.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50))
        constraints.append(et2.topAnchor.constraint(equalTo: et.bottomAnchor, constant: 30))
        constraints.append(et2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50))
        constraints.append(et3.topAnchor.constraint(equalTo: et2.bottomAnchor, constant: 30))
        constraints.append(et3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50))
        
        constraints.append(campoNombre.centerYAnchor.constraint(equalTo: et.centerYAnchor))
        constraints.append(campoNombre.leadingAnchor.constraint(equalTo: et.trailingAnchor, constant: 20))
        constraints.append(campoNombre.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 90))
        constraints.append(campoNombre.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50))
        
        constraints.append(campoPais.centerYAnchor.constraint(equalTo: et2.centerYAnchor))
        constraints.append(campoPais.leadingAnchor.constraint(equalTo: et2.trailingAnchor, constant: 20))
        constraints.append(campoPais.topAnchor.constraint(equalTo: campoNombre.bottomAnchor, constant: 30))
        constraints.append(campoPais.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50))
        constraints.append(campoPais.widthAnchor.constraint(equalTo: campoNombre.widthAnchor))
        
        constraints.append(campoAno.centerYAnchor.constraint(equalTo: et3.centerYAnchor))
        constraints.append(campoAno.leadingAnchor.constraint(equalTo: et3.trailingAnchor, constant: 20))
        constraints.append(campoAno.topAnchor.constraint(equalTo: campoPais.bottomAnchor, constant: 30))
        constraints.append(campoAno.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50))
        constraints.append(campoAno.widthAnchor.constraint(equalTo: campoPais.widthAnchor))
        
        constraints.append(botonHecho.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonHecho.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
    }
    
    @objc func hecho(_ sender : UIButton){
        
        if campoPais.text == "España" || campoPais.text == campoPais.placeholder
        {
            let fabricanteNuevo = Fabricante()
            fabricanteNuevo.nombre = campoNombre.text ?? "Sin nombre"
            fabricanteNuevo.pais = campoPais.text ?? "Sin país"
            fabricanteNuevo.creacion = Int(campoAno.text ?? "1900") ?? 1900
            bmv?.fabricantesNacionales.append(fabricanteNuevo)
            bmv?.tv.reloadData()
            dismiss(animated: true, completion: nil)
        }
        else
        {
            let fabricanteNuevo = Fabricante()
            fabricanteNuevo.nombre = campoNombre.text ?? "Sin nombre"
            fabricanteNuevo.pais = campoPais.text ?? "Sin país"
            fabricanteNuevo.creacion = Int(campoAno.text ?? "1900") ?? 1900
            bmv?.fabricantesExtranjeros.append(fabricanteNuevo)
            bmv?.tv.reloadData()
            dismiss(animated: true, completion: nil)
        }
    }
}
