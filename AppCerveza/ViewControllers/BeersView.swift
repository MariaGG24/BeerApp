//
//  BeersView.swift
//  AppCerveza
//
//  Created by María González García on 20/12/21.
//
// THIS IS THE MASTER BRANCH
//

import UIKit

class BeersView : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var bmv = BeerMakersView()
    var tv = UITableView()
    var constraints = [NSLayoutConstraint]()
    var botonAtras = UIButton()
    var botonAdd = UIButton()
    var etiqueta = UILabel()
    var coleccionFabricantes = [Fabricante]()
    var tiposCerveza = [String]()
    var cervezasOrdenadas = [Cerveza]()
    var fabricante = Fabricante()
    var filasSeccion = [Int]()
    var i = 0
    var fila = 0
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        prepararTableView()
        prepararEtiqueta()
        prepararBoton()
        prepararConstraints()
        
        view.addSubview(tv)
        view.addSubview(botonAtras)
        view.addSubview(botonAdd)
        view.addSubview(etiqueta)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func prepararTableView() {
        
        prepararInformacionFabricante()
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cerveza")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tiposCerveza.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filasSeccion[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cerveza")
        
        cell?.contentView.backgroundColor = .systemBrown
        cell?.contentView.layer.cornerRadius = 16
        
        cell?.textLabel?.textAlignment = .center
        cell?.textLabel?.text = cervezasOrdenadas[i].nombre
        i = i + 1
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sbv = SingleBeerView()
        sbv.modalTransitionStyle = .flipHorizontal
        sbv.modalPresentationStyle = .currentContext
        sbv.bv = self
        sbv.cervezas = cervezasOrdenadas
        sbv.tipos = tiposCerveza
        sbv.seccion = indexPath.section
        sbv.fila = indexPath.row
        sbv.filasSec = filasSeccion
        i = 0
        present(sbv, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return tiposCerveza[section]
    }
    
    func prepararBoton() {
        botonAtras.translatesAutoresizingMaskIntoConstraints = false
        botonAtras.setTitle("Atrás", for: .normal)
        botonAtras.setTitleColor(.blue, for: .normal)
        botonAtras.contentHorizontalAlignment = .center
        botonAtras.layer.cornerRadius = 4
        botonAtras.backgroundColor = .lightGray
        botonAtras.addTarget(self, action: #selector(BeersView.atras), for: .touchUpInside)
        
        botonAdd.translatesAutoresizingMaskIntoConstraints = false
        botonAdd.setTitle("Añadir cerveza", for: .normal)
        botonAdd.setTitleColor(.blue, for: .normal)
        botonAdd.contentHorizontalAlignment = .center
        botonAdd.layer.cornerRadius = 4
        botonAdd.backgroundColor = .lightGray
        botonAdd.addTarget(self, action: #selector(BeersView.addCerveza), for: .touchUpInside)
    }
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.textColor = .systemBrown
        etiqueta.textAlignment = .center
        etiqueta.text = "Listado de Cervezas de " + coleccionFabricantes[fila].nombre
        etiqueta.font = UIFont(name: "Chalkduster", size: 20.0)
    }
    
    func prepararConstraints() {
        constraints.append(etiqueta.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constraints.append(etiqueta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108))
        constraints.append(etiqueta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108))
        
        constraints.append(tv.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 20))
        constraints.append(tv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        constraints.append(tv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        
        constraints.append(botonAdd.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
        constraints.append(botonAdd.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonAdd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        
        constraints.append(botonAtras.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
        constraints.append(botonAtras.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonAtras.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        constraints.append(botonAtras.centerYAnchor.constraint(equalTo: botonAdd.centerYAnchor))
        constraints.append(botonAtras.widthAnchor.constraint(equalTo: botonAdd.widthAnchor))
    }
    
    func prepararInformacionFabricante() {
        
        fabricante = coleccionFabricantes[fila]
        var flag = Bool()
         
        for i in 0..<fabricante.cervezas.count
        {
            flag = false
            for j in 0..<tiposCerveza.count
            {
                if tiposCerveza[j] == fabricante.cervezas[i].tipo
                {
                    flag = true
                    break
                }
            }
            if flag == false
            {
                tiposCerveza.append(fabricante.cervezas[i].tipo)
                ordenarCervezas(fabricante.cervezas[i].tipo)
            }
        }
    }
    
    func ordenarCervezas(_ tipo : String) {
        var cont = 0
        for i in 0..<fabricante.cervezas.count
        {
            if fabricante.cervezas[i].tipo == tipo
            {
                cervezasOrdenadas.append(fabricante.cervezas[i])
                cont = cont + 1
            }
        }
        filasSeccion.append(cont)
    }
    
    @objc func atras(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addCerveza(_ sender : UIButton){
        let abv = AddBeerView()
        abv.bv = self
        abv.modalTransitionStyle = .flipHorizontal
        abv.modalPresentationStyle = .formSheet
        i = 0
        present(abv, animated: true, completion: nil)
    }
}

