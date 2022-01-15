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
    var etiqueta = UILabel()
    var coleccionFabricantes = [Fabricante]()
    var pais = 0
    var fila = 0
    
    override func loadView() {
        super.loadView()
        
        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
        view.backgroundColor = .white
        
        prepararTableView()
        prepararEtiqueta()
        prepararBotones()
        prepararConstraints()
        
        view.addSubview(tv)
        view.addSubview(botonAtras)
        view.addSubview(etiqueta)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func prepararTableView() {
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cerveza")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cerveza")
        
        cell?.contentView.backgroundColor = .systemBrown
        cell?.contentView.layer.cornerRadius = 16
        
        cell?.textLabel?.textAlignment = .center
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sbv = SingleBeerView()
        sbv.modalTransitionStyle = .flipHorizontal
        sbv.modalPresentationStyle = .formSheet
        sbv.bv = self
        sbv.fila = indexPath.row
        present(sbv, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "Tipo 1"
        }
        else
        {
            return "Tipo 2"
        }
    }
    
    func prepararBotones() {
        botonAtras.translatesAutoresizingMaskIntoConstraints = false
        botonAtras.contentHorizontalAlignment = .center
        botonAtras.setTitle("   Atrás   ", for: .normal)
        botonAtras.setTitleColor(.blue, for: .normal)
        botonAtras.backgroundColor = .lightGray
        botonAtras.layer.cornerRadius = 4
        botonAtras.addTarget(self, action: #selector(BeersView.atras), for: .touchUpInside)
    }
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.textColor = .systemBrown
        etiqueta.textAlignment = .center
        etiqueta.text = "Listado de Cervezas de " //Añadir nombre de la marca
        etiqueta.font = UIFont(name: "Chalkduster", size: 20.0)
    }
    
    func prepararConstraints() {
        constraints.append(etiqueta.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constraints.append(etiqueta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108))
        constraints.append(etiqueta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108))
        
        constraints.append(tv.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 20))
        constraints.append(tv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        constraints.append(tv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        
        constraints.append(botonAtras.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
        constraints.append(botonAtras.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonAtras.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
    }
    
    @objc func atras(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}

