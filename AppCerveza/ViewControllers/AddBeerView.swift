//
//  AddBeerView.swift
//  AppCerveza
//
//  Created by María González García on 17/1/22.
//

import Foundation
import UIKit

class AddBeerView : UIViewController {
    
    weak var bv = BeersView()
    var constraints = [NSLayoutConstraint]()
    var etiqueta = UILabel()
    var botonHecho = UIButton()
    var et = UILabel()
    var et2 = UILabel()
    var et3 = UILabel()
    var et4 = UILabel()
    var campoNombre = UITextField()
    var campoTipo = UITextField()
    var campoGraduacion = UITextField()
    var campoAporteCalorico = UITextField()
    
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
        view.addSubview(et4)
        view.addSubview(campoTipo)
        view.addSubview(campoNombre)
        view.addSubview(campoGraduacion)
        view.addSubview(campoAporteCalorico)
        view.addSubview(botonHecho)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.text = "Añada una nueva cerveza"
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
        botonHecho.addTarget(self, action: #selector(AddBeerView.hecho), for: .touchUpInside)
    }
    
    func prepararElementosAdicion() {
        et.translatesAutoresizingMaskIntoConstraints = false
        et.text = "Introduzca el nombre de la nueva cerveza: "
        et.font = UIFont(name: "Chalkduster", size: 10.0)
        et.textColor = .systemBrown
        et.textAlignment = .left
        
        et2.translatesAutoresizingMaskIntoConstraints = false
        et2.text = "Introduzca el tipo de la nueva cerveza: "
        et2.font = UIFont(name: "Chalkduster", size: 10.0)
        et2.textColor = .systemBrown
        et2.textAlignment = .left
        
        et3.translatesAutoresizingMaskIntoConstraints = false
        et3.text = "Introduzca la graduación de la nueva cerveza: "
        et3.font = UIFont(name: "Chalkduster", size: 10.0)
        et3.textColor = .systemBrown
        et3.textAlignment = .left
        
        et4.translatesAutoresizingMaskIntoConstraints = false
        et4.text = "Introduzca el aporte calórico de la nueva cerveza: "
        et4.font = UIFont(name: "Chalkduster", size: 10.0)
        et4.textColor = .systemBrown
        et4.textAlignment = .left
        
        campoNombre.translatesAutoresizingMaskIntoConstraints = false
        campoNombre.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoNombre.textAlignment = .right
        campoNombre.borderStyle = .roundedRect
        campoNombre.layer.borderWidth = 2
        campoNombre.placeholder = "Sin nombre"
        
        campoTipo.translatesAutoresizingMaskIntoConstraints = false
        campoTipo.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoTipo.textAlignment = .right
        campoTipo.borderStyle = .roundedRect
        campoTipo.layer.borderWidth = 2
        campoTipo.placeholder = "Sin tipo"
        
        campoGraduacion.translatesAutoresizingMaskIntoConstraints = false
        campoGraduacion.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoGraduacion.textAlignment = .right
        campoGraduacion.borderStyle = .roundedRect
        campoGraduacion.layer.borderWidth = 2
        campoGraduacion.placeholder = "0.0"
        
        campoAporteCalorico.translatesAutoresizingMaskIntoConstraints = false
        campoAporteCalorico.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoAporteCalorico.textAlignment = .right
        campoAporteCalorico.borderStyle = .roundedRect
        campoAporteCalorico.layer.borderWidth = 2
        campoAporteCalorico.placeholder = "0.0"
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
        constraints.append(et4.topAnchor.constraint(equalTo: et3.bottomAnchor, constant: 30))
        constraints.append(et4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50))
        
        constraints.append(campoNombre.centerYAnchor.constraint(equalTo: et.centerYAnchor))
        constraints.append(campoNombre.leadingAnchor.constraint(equalTo: et.trailingAnchor, constant: 20))
        constraints.append(campoNombre.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 90))
        constraints.append(campoNombre.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50))
        
        constraints.append(campoTipo.centerYAnchor.constraint(equalTo: et2.centerYAnchor))
        constraints.append(campoTipo.leadingAnchor.constraint(equalTo: et2.trailingAnchor, constant: 20))
        constraints.append(campoTipo.topAnchor.constraint(equalTo: campoNombre.bottomAnchor, constant: 30))
        constraints.append(campoTipo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50))
        constraints.append(campoTipo.widthAnchor.constraint(equalTo: campoTipo.widthAnchor))
        
        constraints.append(campoGraduacion.centerYAnchor.constraint(equalTo: et3.centerYAnchor))
        constraints.append(campoGraduacion.leadingAnchor.constraint(equalTo: et3.trailingAnchor, constant: 20))
        constraints.append(campoGraduacion.topAnchor.constraint(equalTo: campoTipo.bottomAnchor, constant: 30))
        constraints.append(campoGraduacion.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50))
        constraints.append(campoGraduacion.widthAnchor.constraint(equalTo: campoTipo.widthAnchor))
        
        constraints.append(campoAporteCalorico.centerYAnchor.constraint(equalTo: et4.centerYAnchor))
        constraints.append(campoAporteCalorico.leadingAnchor.constraint(equalTo: et4.trailingAnchor, constant: 20))
        constraints.append(campoAporteCalorico.topAnchor.constraint(equalTo: campoGraduacion.bottomAnchor, constant: 30))
        constraints.append(campoAporteCalorico.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50))
        constraints.append(campoAporteCalorico.widthAnchor.constraint(equalTo: campoGraduacion.widthAnchor))
        
        constraints.append(botonHecho.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonHecho.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
    }
    
    @objc func hecho(_ sender : UIButton){
        
        if campoTipo.text == ""
        {
            let cervezaNueva = Cerveza()
            cervezaNueva.nombre = "Sin nombre"
            cervezaNueva.tipo = "Sin tipo"
            cervezaNueva.graduacion = Float(campoGraduacion.text ?? "0.0") ?? 0.0
            cervezaNueva.aporteCalorico = Float(campoAporteCalorico.text ?? "0.0") ?? 0.0
            bv?.cervezasOrdenadas.append(cervezaNueva)
            bv?.tiposCerveza.append(cervezaNueva.tipo)
            bv?.filasSeccion.append(1)
            bv?.tv.reloadData()
            dismiss(animated: true, completion: nil)
        }
        else
        {
            var flag = false
            for i in 0..<(bv?.tiposCerveza.count)!
            {
                if campoTipo.text == bv?.tiposCerveza[i]
                {
                    flag = true
                    for j in 0..<(bv?.cervezasOrdenadas.count)!
                    {
                        if bv?.cervezasOrdenadas[j].tipo == campoTipo.text
                        {
                            let pos = j + (bv?.filasSeccion[i])!
                            let cervezaNueva = Cerveza()
                            cervezaNueva.nombre = campoNombre.text ?? "Sin nombre"
                            cervezaNueva.tipo = campoTipo.text ?? "Sin tipo"
                            cervezaNueva.graduacion = Float(campoGraduacion.text ?? "0.0") ?? 0.0
                            cervezaNueva.aporteCalorico = Float(campoAporteCalorico.text ?? "0.0") ?? 0.0
                            bv?.cervezasOrdenadas.insert(cervezaNueva, at: pos)
                            bv?.filasSeccion[i] = (bv?.filasSeccion[i])! + 1
                            bv?.tv.reloadData()
                            dismiss(animated: true, completion: nil)
                        }
                    }
                }
                if flag == true
                {
                    break
                }
            }
            if flag == false
            {
                let cervezaNueva = Cerveza()
                cervezaNueva.nombre = campoNombre.text ?? "Sin nombre"
                cervezaNueva.tipo = campoTipo.text ?? "Sin tipo"
                cervezaNueva.graduacion = Float(campoGraduacion.text ?? "0.0") ?? 0.0
                cervezaNueva.aporteCalorico = Float(campoAporteCalorico.text ?? "0.0") ?? 0.0
                bv?.cervezasOrdenadas.append(cervezaNueva)
                bv?.tiposCerveza.append(cervezaNueva.tipo)
                bv?.filasSeccion.append(1)
                bv?.tv.reloadData()
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
