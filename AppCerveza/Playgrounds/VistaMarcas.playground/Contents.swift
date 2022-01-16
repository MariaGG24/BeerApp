////THIS IS THE MASTER BRANCH
//import UIKit
//import PlaygroundSupport
//class VistasMarcas : UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    var etiqueta = UILabel()
//    var tv = UITableView()
//    var botonAdd = UIButton()
//    var botonDelete = UIButton()
//    var constraints = [NSLayoutConstraint]()
//    
//    //VARIABLES DE PRUEBAS
//    let nombres = ["Mahou", "Estrella Galicia", "Heineken", "Leffe", "Estrella Damm", "Bavaria"]
//    let paises = ["España", "España", "Países Bajos", "Bélgica", "España", "Colombia"]
//    var cerveza = Cerveza()
//    var i = 0
//    
//    var fabricantes = [Fabricante]()
//    public var fabricantesNacionales = [Fabricante]()
//    public var fabricantesExtranjeros = [Fabricante]()
//    
//    override func loadView() {
//        super.loadView()
//        
//        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
//        view.backgroundColor = .white
//        
//        prepararTableView()
//        prepararBotones()
//        prepararEtiqueta()
//        prepararConstraints()
//                
//        view.addSubview(tv)
//        view.addSubview(etiqueta)
//        view.addSubview(botonAdd)
//        view.addSubview(botonDelete)
//        
//        NSLayoutConstraint.activate(constraints)
//    }
//    
//    func prepararTableView() {
//        prepararInformacionAMostrar()
//        tv.translatesAutoresizingMaskIntoConstraints = false
////        tv = UITableView(frame: UIScreen.main.bounds, style: .plain)
//        tv.backgroundColor = .white
//        tv.delegate = self
//        tv.dataSource = self
//        tv.register(UITableViewCell.self, forCellReuseIdentifier: "fabricante")
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0
//        {
//            return fabricantesNacionales.count
//        }
//        else
//        {
//            return fabricantesExtranjeros.count
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "fabricante")
//        
//        cell?.contentView.backgroundColor = .systemBrown
//        cell?.contentView.layer.cornerRadius = 16
//        
//        cell?.textLabel?.textAlignment = .center
//        //cell?.textLabel?.text = "\(indexPath.row)"
//        if indexPath.section == 0
//        {
//            cell?.textLabel?.text = fabricantesNacionales[indexPath.row].nombre
//        }
//        else
//        {
//            cell?.textLabel?.text = fabricantesExtranjeros[indexPath.row].nombre
//            i = i+1
//        }
//        
//        return cell!
//    }
//    
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = VistaCervezas()
//        vc.modalPresentationStyle = .currentContext
//        vc.modalTransitionStyle = .flipHorizontal
//        vc.vm = self
//        //vc.pais = indexPath.section
//        vc.fila = indexPath.row
//        
//        if(indexPath.section == 0)
//        {
//            vc.coleccionFabricantes = fabricantesNacionales
//        }
//        else
//        {
//            vc.coleccionFabricantes = fabricantesExtranjeros
//        }
//        
//        present(vc, animated: true, completion: nil)
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0
//        {
//            return "Fabricantes nacionales"
//                    }
//        else
//        {
//            return "Fabricantes extranjeros"
//        }
//    }
//    
//    func prepararBotones() {
//        
//        botonAdd.translatesAutoresizingMaskIntoConstraints = false
//        botonAdd.backgroundColor = .lightGray
//        botonAdd.setTitle(" Añadir Fabricante ", for: .normal)
//        botonAdd.setTitleColor(.blue, for: .normal)
//        botonAdd.contentHorizontalAlignment = .center
//        botonAdd.layer.cornerRadius = 4
//        botonAdd.addTarget(self, action: #selector(VistasMarcas.botonAnadir), for: .touchUpInside)
//        
//        botonDelete.translatesAutoresizingMaskIntoConstraints = false
//        botonDelete.backgroundColor = .lightGray
//        botonDelete.setTitle("  Eliminar Fabricante  ", for: .normal)
//        botonDelete.setTitleColor(.blue, for: .normal)
//        botonDelete.contentHorizontalAlignment = .center
//        botonDelete.layer.cornerRadius = 4
//        botonDelete.addTarget(self, action: #selector(VistasMarcas.botonEliminar), for: .touchUpInside)
//    }
//    
//    func prepararEtiqueta() {
//        etiqueta.translatesAutoresizingMaskIntoConstraints = false
//        etiqueta.text = "Fabricantes de cerveza"
//        etiqueta.font = UIFont(name: "Chalkduster", size: 20.0)
//        etiqueta.textColor = .systemBrown
//        etiqueta.textAlignment = .center
//    }
//    
//    func prepararConstraints() {
//        constraints.append(etiqueta.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
//        constraints.append(etiqueta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108))
//        constraints.append(etiqueta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108))
//        
//        constraints.append(tv.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 20))
//        constraints.append(tv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
//        constraints.append(tv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
//        
//        constraints.append(botonAdd.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
//        constraints.append(botonAdd.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
//        constraints.append(botonAdd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
//        
//        constraints.append(botonDelete.topAnchor.constraint(equalTo: tv.bottomAnchor, constant: 20))
//        constraints.append(botonDelete.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
//        constraints.append(botonDelete.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
//        constraints.append(botonDelete.centerYAnchor.constraint(equalTo: botonAdd.centerYAnchor))
//        constraints.append(botonDelete.widthAnchor.constraint(equalTo: botonAdd.widthAnchor))
//    }
//    
//    func prepararInformacionAMostrar() {
//        for i in 0..<nombres.count {
//            let fabricante = Fabricante()
//            fabricante.nombre = nombres[i]
//            fabricante.pais = paises[i]
//            fabricante.logo = nil
//            fabricante.cervezas = insertarCervezas(fabricante.nombre)
//            
//            if fabricante.pais == "España"
//            {
//                fabricantesNacionales.append(fabricante)
//            }
//            else
//            {
//                fabricantesExtranjeros.append(fabricante)
//            }
//        }
//    }
//    
//    func insertarCervezas(_ fab : String) -> [Cerveza] {
//        var cerv = [Cerveza]()
//        
//        if fab == "Mahou"
//        {
//            let c = Cerveza()
//            c.nombre = "Mahou Maestra"
//            c.aporteCalorico = 67.0
//            c.graduacion = 7.5
//            c.tipo = "Doppelock"
//            c.logo = nil
//            cerv.append(c)
//            
//            let c1 = Cerveza()
//            c1.nombre = "Mahou Mixta"
//            c1.aporteCalorico = 29.0
//            c1.graduacion = 0.9
//            c1.tipo = "Radler"
//            c1.logo = nil
//            cerv.append(c1)
//        }
//        else if fab == "Estrella Galicia"
//        {
//            let c = Cerveza()
//            c.nombre = "Estrella Galicia Especial"
//            c.aporteCalorico = 47.0
//            c.graduacion = 5.5
//            c.tipo = "Lager Especial"
//            c.logo = nil
//            cerv.append(c)
//            
//            let c1 = Cerveza()
//            c1.nombre = "Estrella del Camino"
//            c1.aporteCalorico = 46.0
//            c1.graduacion = 5.3
//            c1.tipo = "WITBIER"
//            c1.logo = nil
//            cerv.append(c1)
//            
//            let c2 = Cerveza()
//            c2.nombre = "Estrella Galicia 00 Tostada"
//            c2.aporteCalorico = 24.0
//            c2.graduacion = 0.0
//            c2.tipo = "Sin Alcohol"
//            c2.logo = nil
//            cerv.append(c2)
//        }
//        else if fab == "Heineken"
//        {
//            let c = Cerveza()
//            c.nombre = "Heineken Original"
//            c.aporteCalorico = 42.0
//            c.graduacion = 5.0
//            c.tipo = "Lager Pilsen Premium"
//            c.logo = nil
//            cerv.append(c)
//            
//            let c1 = Cerveza()
//            c1.nombre = "Heineken 0.0"
//            c1.aporteCalorico = 21.0
//            c1.graduacion = 0.0
//            c1.tipo = "Sin Alcohol"
//            c1.logo = nil
//            cerv.append(c1)
//        }
//        else if fab == "Leffe"
//        {
//            let c = Cerveza()
//            c.nombre = "Leffe Blonde"
//            c.aporteCalorico = 42.0
//            c.graduacion = 6.6
//            c.tipo = "Pale Ale"
//            c.logo = nil
//            cerv.append(c)
//            
//            let c1 = Cerveza()
//            c1.nombre = "Leffe Ruby"
//            c1.aporteCalorico = 55.0
//            c1.graduacion = 5.0
//            c1.tipo = "Lambic"
//            c1.logo = nil
//            cerv.append(c1)
//        }
//        else if fab == "Estrella Damm"
//        {
//            let c = Cerveza()
//            c.nombre = "Voll-Damm"
//            c.aporteCalorico = 66.0
//            c.graduacion = 7.2
//            c.tipo = "Märzenbier"
//            c.logo = nil
//            cerv.append(c)
//            
//            let c1 = Cerveza()
//            c1.nombre = "Equilater"
//            c1.aporteCalorico = 75.0
//            c1.graduacion = 11.0
//            c1.tipo = "Imperial Stout"
//            c1.logo = nil
//            cerv.append(c1)
//            
//            let c2 = Cerveza()
//            c2.nombre = "Malquerida"
//            c2.aporteCalorico = 45.0
//            c2.graduacion = 5.0
//            c2.tipo = "Lager"
//            c2.logo = nil
//            cerv.append(c2)
//        }
//        else
//        {
//            let c = Cerveza()
//            c.nombre = "Corona Extra"
//            c.aporteCalorico = 42.0
//            c.graduacion = 4.5
//            c.tipo = "Lager"
//            c.logo = nil
//            cerv.append(c)
//            
//            let c1 = Cerveza()
//            c1.nombre = "Budweiser"
//            c1.aporteCalorico = 43.0
//            c1.graduacion = 5.0
//            c1.tipo = "Lager"
//            c1.logo = nil
//            cerv.append(c1)
//            
//            let c2 = Cerveza()
//            c2.nombre = "Poker"
//            c2.aporteCalorico = 142.0
//            c2.graduacion = 4.0
//            c2.tipo = "Lager"
//            c2.logo = nil
//            cerv.append(c2)
//        }
//        return cerv
//    }
//    
//    @objc func botonAnadir(_ sender : UIButton) {
//        let vnf = VistaNuevoFabricante()
//        vnf.modalTransitionStyle = .flipHorizontal
//        vnf.modalPresentationStyle = .formSheet
//        present(vnf, animated: true, completion: nil)
//    }
//    
//    @objc func botonEliminar(_ sender : UIButton) {
//    }
//}
//PlaygroundPage.current.liveView = VistasMarcas()
