//
//  BeerMakersView.swift
//  AppCerveza
//
//  Created by María González García on 17/12/21.
//
// THIS IS THE MASTER BRANCH
//

import UIKit

class BeerMakersView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var etiqueta = UILabel()
    var tv = UITableView()
    var botonAdd = UIButton()
    
//    var botonDelete = UIButton()
    var constraints = [NSLayoutConstraint]()
    public var fabricantesNacionales = [Fabricante]()
    public var fabricantesExtranjeros = [Fabricante]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        prepararTableView()
        prepararBotones()
        prepararEtiqueta()
        prepararConstraints()
                
        view.addSubview(tv)
        view.addSubview(etiqueta)
        view.addSubview(botonAdd)
//        view.addSubview(botonDelete)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func prepararTableView() {
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "fabricante")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return fabricantesNacionales.count
        }
        else
        {
            return fabricantesExtranjeros.count
        }
    }
    
    @objc func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fabricante")
        
        cell?.contentView.backgroundColor = .systemBrown
        cell?.contentView.layer.cornerRadius = 16
        
        cell?.textLabel?.textAlignment = .center
        cell?.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(BeerMakersView.eliminarFabricante)))
        if indexPath.section == 0
        {
            cell?.textLabel?.text = fabricantesNacionales[indexPath.row].nombre
        }
        else
        {
            cell?.textLabel?.text = fabricantesExtranjeros[indexPath.row].nombre
        }
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bv = BeersView()
        bv.modalPresentationStyle = .formSheet
        bv.modalTransitionStyle = .flipHorizontal
        bv.bmv = self
        bv.fila = indexPath.row
        
        if(indexPath.section == 0)
        {
            bv.coleccionFabricantes = fabricantesNacionales
        }
        else
        {
            bv.coleccionFabricantes = fabricantesExtranjeros
        }
        
        present(bv, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "Fabricantes nacionales"
        }
        else
        {
            return "Fabricantes extranjeros"
        }
    }
    
    func prepararBotones() {
        
        botonAdd.translatesAutoresizingMaskIntoConstraints = false
        botonAdd.backgroundColor = .lightGray
        botonAdd.setTitle(" Añadir Fabricante ", for: .normal)
        botonAdd.setTitleColor(.blue, for: .normal)
        botonAdd.contentHorizontalAlignment = .center
        botonAdd.layer.cornerRadius = 4
        botonAdd.addTarget(self, action: #selector(BeerMakersView.botonAnadir), for: .touchUpInside)
        
//        botonDelete.translatesAutoresizingMaskIntoConstraints = false
//        botonDelete.backgroundColor = .lightGray
//        botonDelete.setTitle("  Eliminar Fabricante  ", for: .normal)
//        botonDelete.setTitleColor(.blue, for: .normal)
//        botonDelete.contentHorizontalAlignment = .center
//        botonDelete.layer.cornerRadius = 4
//        botonDelete.addTarget(self, action: #selector(BeerMakersView.botonEliminar), for: .touchUpInside)
    }
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.text = "Fabricantes de cerveza"
        etiqueta.font = UIFont(name: "Chalkduster", size: 40.0)
        etiqueta.textColor = .systemBrown
        etiqueta.textAlignment = .center
    }
    
    func prepararConstraints() {
        constraints.append(etiqueta.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20))
        constraints.append(etiqueta.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 108))
        constraints.append(etiqueta.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -108))
        
        constraints.append(tv.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 20))
        constraints.append(tv.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(tv.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        
        constraints.append(botonAdd.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
        constraints.append(botonAdd.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20))
        constraints.append(botonAdd.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        
//        constraints.append(botonDelete.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
//        constraints.append(botonDelete.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20))
//        constraints.append(botonDelete.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
//        constraints.append(botonDelete.centerYAnchor.constraint(equalTo: botonAdd.centerYAnchor))
//        constraints.append(botonDelete.widthAnchor.constraint(equalTo: botonAdd.widthAnchor))
//        constraints.append(botonDelete.heightAnchor.constraint(equalTo: botonAdd.heightAnchor))
    }
    
    @objc func botonAnadir(_ sender : UIButton) {
        let abmv = AddBeerMakerView()
        abmv.modalTransitionStyle = .flipHorizontal
        abmv.modalPresentationStyle = .formSheet
        abmv.bmv = self
        present(abmv, animated: true, completion: nil)
    }
    
    
    
    @objc func eliminarFabricante(_ sender : UILongPressGestureRecognizer) {
        
        let pos = sender.location(in: sender.view)
        
    }
}
