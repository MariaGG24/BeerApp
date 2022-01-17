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
    var botonHecho = UIButton()
    var nombre = UILabel()
    var tipo = UILabel()
    var graduacion = UILabel()
    var aporteCalorico = UILabel()
    var campoNombre = UITextField()
    var campoTipo = UITextField()
    var campoGraduacion = UITextField()
    var campoAporteCalorico = UITextField()
    var t = String()
    var iV = UIImageView()
    var cervezas = [Cerveza]()
    var tipos = [String]()
    var seccion = Int()
    var fila = Int()
    var filasSec = [Int]()
    var cervezaElegida = Cerveza()
    var pos = 0
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        prepararElementosInformacion()
        prepararEtiqueta()
        prepararBoton()
        prepararConstraints()
        
        view.addSubview(etiqueta)
        view.addSubview(botonHecho)
        view.addSubview(nombre)
        view.addSubview(graduacion)
        view.addSubview(aporteCalorico)
        view.addSubview(tipo)
        view.addSubview(campoNombre)
        view.addSubview(campoGraduacion)
        view.addSubview(campoAporteCalorico)
        view.addSubview(campoTipo)
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
        botonHecho.translatesAutoresizingMaskIntoConstraints = false
        botonHecho.setTitle("Hecho", for: .normal)
        botonHecho.setTitleColor(.blue, for: .normal)
        botonHecho.contentHorizontalAlignment = .center
        botonHecho.layer.cornerRadius = 4
        botonHecho.backgroundColor = .lightGray
        botonHecho.addTarget(self, action: #selector(SingleBeerView.hecho), for: .touchUpInside)
        
    }
    
    func prepararElementosInformacion() {
        
        while cervezas[pos].tipo != tipos[seccion]
        {
            pos = pos + 1
        }
        pos = pos + fila
        cervezaElegida = cervezas[pos]
        
        nombre.translatesAutoresizingMaskIntoConstraints = false
        nombre.text = "Nombre de la Cerveza: "
        nombre.textAlignment = .center
        nombre.textColor = .systemBrown
        nombre.font = UIFont(name: "Chalkduster", size: 15.0)
        
        campoNombre.translatesAutoresizingMaskIntoConstraints = false
        campoNombre.placeholder = cervezaElegida.nombre
        campoNombre.layer.borderWidth = 2
        campoNombre.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoNombre.textAlignment = .right
        campoNombre.borderStyle = .roundedRect
        
        graduacion.translatesAutoresizingMaskIntoConstraints = false
        graduacion.text = "Graduación de la Cerveza: "
        graduacion.textAlignment = .center
        graduacion.textColor = .systemBrown
        graduacion.font = UIFont(name: "Chalkduster", size: 15.0)
        
        campoGraduacion.translatesAutoresizingMaskIntoConstraints = false
        campoGraduacion.placeholder = String(cervezaElegida.graduacion)
        campoGraduacion.layer.borderWidth = 2
        campoGraduacion.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoGraduacion.textAlignment = .right
        campoGraduacion.borderStyle = .roundedRect
        
        aporteCalorico.translatesAutoresizingMaskIntoConstraints = false
        aporteCalorico.text = "Aporte calórico de la Cerveza: "
        aporteCalorico.textAlignment = .center
        aporteCalorico.textColor = .systemBrown
        aporteCalorico.font = UIFont(name: "Chalkduster", size: 15.0)
        
        campoAporteCalorico.translatesAutoresizingMaskIntoConstraints = false
        campoAporteCalorico.placeholder = String(cervezaElegida.aporteCalorico)
        campoAporteCalorico.layer.borderWidth = 2
        campoAporteCalorico.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoAporteCalorico.textAlignment = .right
        campoAporteCalorico.borderStyle = .roundedRect
        
        tipo.translatesAutoresizingMaskIntoConstraints = false
        tipo.text = "Tipo de la Cerveza: "
        tipo.textAlignment = .center
        tipo.textColor = .systemBrown
        tipo.font = UIFont(name: "Chalkduster", size: 15.0)
        
        campoTipo.translatesAutoresizingMaskIntoConstraints = false
        campoTipo.placeholder = cervezaElegida.tipo
        campoTipo.layer.borderWidth = 2
        campoTipo.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        campoTipo.textAlignment = .right
        campoTipo.borderStyle = .roundedRect
        
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
        constraints.append(nombre.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        constraints.append(graduacion.topAnchor.constraint(equalTo: nombre.bottomAnchor, constant: 20))
        constraints.append(graduacion.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        constraints.append(aporteCalorico.topAnchor.constraint(equalTo: graduacion.bottomAnchor, constant: 20))
        constraints.append(aporteCalorico.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        constraints.append(tipo.topAnchor.constraint(equalTo: aporteCalorico.bottomAnchor, constant: 20))
        constraints.append(tipo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        constraints.append(iV.topAnchor.constraint(equalTo: tipo.bottomAnchor, constant: 20))
        constraints.append(iV.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(campoNombre.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 30))
        constraints.append(campoNombre.centerYAnchor.constraint(equalTo: nombre.centerYAnchor))
        constraints.append(campoNombre.leadingAnchor.constraint(equalTo: nombre.trailingAnchor, constant: 20))
        constraints.append(campoGraduacion.topAnchor.constraint(equalTo: campoNombre.bottomAnchor, constant: 20))
        constraints.append(campoGraduacion.centerYAnchor.constraint(equalTo: graduacion.centerYAnchor))
        constraints.append(campoGraduacion.leadingAnchor.constraint(equalTo: graduacion.trailingAnchor, constant: 20))
        constraints.append(campoAporteCalorico.topAnchor.constraint(equalTo: campoGraduacion.bottomAnchor, constant: 20))
        constraints.append(campoAporteCalorico.centerYAnchor.constraint(equalTo: aporteCalorico.centerYAnchor))
        constraints.append(campoAporteCalorico.leadingAnchor.constraint(equalTo: aporteCalorico.trailingAnchor, constant: 20))
        constraints.append(campoTipo.topAnchor.constraint(equalTo: campoAporteCalorico.bottomAnchor, constant: 20))
        constraints.append(campoTipo.centerYAnchor.constraint(equalTo: tipo.centerYAnchor))
        constraints.append(campoTipo.leadingAnchor.constraint(equalTo: tipo.trailingAnchor, constant: 20))
        
        constraints.append(botonHecho.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonHecho.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
    }
    
    @objc func hecho(_ sender : UIButton) {
        
        if campoNombre.text != cervezas[pos].nombre
        {
            cervezaElegida.nombre = campoNombre.text ?? "Sin nombre"
        }
        
        if campoTipo.text != cervezas[pos].tipo
        {
            for i in 0..<(bv?.tiposCerveza.count)!
            {
                if bv?.tiposCerveza[i] == campoTipo.text
                {
                    bv?.filasSeccion[i] = (bv?.filasSeccion[i])! - 1
                    if bv?.filasSeccion[i] == 0
                    {
                        bv?.filasSeccion.remove(at: i)
                        bv?.tiposCerveza.remove(at: i)
                    }
                }
            }
            cervezaElegida.tipo = campoTipo.text ?? "Sin tipo"
        }
                    
        if campoGraduacion.text != String(cervezas[pos].graduacion)
        {
            cervezaElegida.graduacion = Float(campoGraduacion.text ?? "0.0") ?? 0.0
        }
        
        if campoAporteCalorico.text != String(cervezas[pos].aporteCalorico)
        {
            cervezaElegida.aporteCalorico = Float(campoAporteCalorico.text ?? "0.0") ?? 0.0
        }
        
        cervezas[pos] = cervezaElegida
        bv?.cervezasOrdenadas = cervezas
        pos = 0
        bv?.tv.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}

