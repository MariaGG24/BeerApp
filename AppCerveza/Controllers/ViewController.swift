//
//  ViewController.swift
//  AppCerveza
//
//  Created by María González García on 17/12/21.
//
// THIS IS THE MASTER BRANCH
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var etiqueta = UILabel()
    var tv = UITableView()
    var botonAdd = UIButton()
    var botonDelete = UIButton()
    var constraints = [NSLayoutConstraint]()

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
        view.addSubview(botonDelete)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func prepararTableView() {
        tv.translatesAutoresizingMaskIntoConstraints = false
        //tv = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "fabricante")
    }
    
    @nonobjc func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fabricante")
        
        cell?.contentView.backgroundColor = .systemBrown
        cell?.contentView.layer.cornerRadius = 16
        
        cell?.textLabel?.textAlignment = .center
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
    }
    
    @nonobjc func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
        botonAdd.setTitle("Añadir Fabricante", for: .normal)
        botonAdd.setTitleColor(.blue, for: .normal)
        botonAdd.contentHorizontalAlignment = .center
        botonAdd.addTarget(self, action: #selector(ViewController.botonAnadir), for: .touchUpInside)
        
        botonDelete.translatesAutoresizingMaskIntoConstraints = false
        botonDelete.backgroundColor = .lightGray
        botonDelete.setTitle("Eliminar Fabricante", for: .normal)
        botonDelete.setTitleColor(.blue, for: .normal)
        botonDelete.contentHorizontalAlignment = .center
        botonDelete.addTarget(self, action: #selector(ViewController.botonEliminar), for: .touchUpInside)
    }
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.text = "Fabricantes de cerveza"
        etiqueta.font = UIFont(name: "Chalkduster", size: 20.0)
        etiqueta.textColor = .systemBrown
        etiqueta.textAlignment = .center
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
        
        constraints.append(botonDelete.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
        constraints.append(botonDelete.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonDelete.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        constraints.append(botonDelete.centerYAnchor.constraint(equalTo: botonAdd.centerYAnchor))
        constraints.append(botonDelete.widthAnchor.constraint(equalTo: botonAdd.widthAnchor))
    }
    
    @objc func botonAnadir(_ sender : UIButton) {
        etiqueta.text = "Has pulsado el botón de Añadir Fabricante"
    }
    
    @objc func botonEliminar(_ sender : UIButton) {
        etiqueta.text = "Has pulsado el botón de Eliminar Fabricante"
    }
}

