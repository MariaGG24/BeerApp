//THIS IS THE MASTER BRANCH
import UIKit
import PlaygroundSupport
import Foundation

class VistasMarcas : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var etiqueta = UILabel()
    var tv = UITableView()
    var botonAdd = UIButton()
    var botonDelete = UIButton()
    var constraints = [NSLayoutConstraint]()
    
    //VARIABLES DE PRUEBAS
    let nombres = ["Mahou", "Estrella Galicia", "Heineken", "Leffe", "Estrella Damm", "Bavaria"]
    let paises = ["España", "España", "Países Bajos", "Bélgica", "España", "Colombia"]
    var cerveza = Cerveza()
//    var i = 0
    
    var fabricantes = [Fabricante]()
    public var fabricantesNacionales = [Fabricante]()
    public var fabricantesExtranjeros = [Fabricante]()
    
    override func loadView() {
        super.loadView()
        
        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
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
        prepararInformacionAMostrar()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "fabricante")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return fabricantesNacionales.count
        }
        else
        {
            return fabricantesExtranjeros.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fabricante")
        
        cell?.contentView.backgroundColor = .systemBrown
        cell?.contentView.layer.cornerRadius = 16
        
        cell?.textLabel?.textAlignment = .center
        if indexPath.section == 0
        {
            cell?.textLabel?.text = fabricantesNacionales[indexPath.row].nombre
        }
        else
        {
            cell?.textLabel?.text = fabricantesExtranjeros[indexPath.row].nombre
//            i = i+1
        }
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = VistaCervezas()
        vc.modalPresentationStyle = .currentContext
        vc.modalTransitionStyle = .flipHorizontal
        vc.vm = self
        vc.fila = indexPath.row
        
        if(indexPath.section == 0)
        {
            vc.coleccionFabricantes = fabricantesNacionales
        }
        else
        {
            vc.coleccionFabricantes = fabricantesExtranjeros
        }
        
        present(vc, animated: true, completion: nil)
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
        botonAdd.addTarget(self, action: #selector(VistasMarcas.botonAnadir), for: .touchUpInside)
        
        botonDelete.translatesAutoresizingMaskIntoConstraints = false
        botonDelete.backgroundColor = .lightGray
        botonDelete.setTitle("  Eliminar Fabricante  ", for: .normal)
        botonDelete.setTitleColor(.blue, for: .normal)
        botonDelete.contentHorizontalAlignment = .center
        botonDelete.layer.cornerRadius = 4
        botonDelete.addTarget(self, action: #selector(VistasMarcas.botonEliminar), for: .touchUpInside)
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
    
    func prepararInformacionAMostrar() {
        for i in 0..<nombres.count {
            let fabricante = Fabricante()
            fabricante.nombre = nombres[i]
            fabricante.pais = paises[i]
            fabricante.cervezas = insertarCervezas(fabricante.nombre)
            
            if fabricante.pais == "España"
            {
                fabricantesNacionales.append(fabricante)
            }
            else
            {
                fabricantesExtranjeros.append(fabricante)
            }
        }
    }
    
    func insertarCervezas(_ fab : String) -> [Cerveza] {
        var cerv = [Cerveza]()
        
        if fab == "Mahou"
        {
            let c = Cerveza()
            c.nombre = "Mahou Maestra"
            c.aporteCalorico = 67.0
            c.graduacion = 7.5
            c.tipo = "Doppelock"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Mahou Mixta"
            c1.aporteCalorico = 29.0
            c1.graduacion = 0.9
            c1.tipo = "Radler"
            cerv.append(c1)
        }
        else if fab == "Estrella Galicia"
        {
            let c = Cerveza()
            c.nombre = "Estrella Galicia Especial"
            c.aporteCalorico = 47.0
            c.graduacion = 5.5
            c.tipo = "Lager Especial"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Estrella del Camino"
            c1.aporteCalorico = 46.0
            c1.graduacion = 5.3
            c1.tipo = "WITBIER"
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Estrella Galicia 00 Tostada"
            c2.aporteCalorico = 24.0
            c2.graduacion = 0.0
            c2.tipo = "Sin Alcohol"
            cerv.append(c2)
        }
        else if fab == "Heineken"
        {
            let c = Cerveza()
            c.nombre = "Heineken Original"
            c.aporteCalorico = 42.0
            c.graduacion = 5.0
            c.tipo = "Lager Pilsen Premium"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Heineken 0.0"
            c1.aporteCalorico = 21.0
            c1.graduacion = 0.0
            c1.tipo = "Sin Alcohol"
            cerv.append(c1)
        }
        else if fab == "Leffe"
        {
            let c = Cerveza()
            c.nombre = "Leffe Blonde"
            c.aporteCalorico = 42.0
            c.graduacion = 6.6
            c.tipo = "Pale Ale"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Leffe Ruby"
            c1.aporteCalorico = 55.0
            c1.graduacion = 5.0
            c1.tipo = "Lambic"
            cerv.append(c1)
        }
        else if fab == "Estrella Damm"
        {
            let c = Cerveza()
            c.nombre = "Voll-Damm"
            c.aporteCalorico = 66.0
            c.graduacion = 7.2
            c.tipo = "Märzenbier"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Equilater"
            c1.aporteCalorico = 75.0
            c1.graduacion = 11.0
            c1.tipo = "Imperial Stout"
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Malquerida"
            c2.aporteCalorico = 45.0
            c2.graduacion = 5.0
            c2.tipo = "Lager"
            cerv.append(c2)
        }
        else
        {
            let c = Cerveza()
            c.nombre = "Corona Extra"
            c.aporteCalorico = 42.0
            c.graduacion = 4.5
            c.tipo = "Lager"
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Budweiser"
            c1.aporteCalorico = 43.0
            c1.graduacion = 5.0
            c1.tipo = "Lager"
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Poker"
            c2.aporteCalorico = 142.0
            c2.graduacion = 4.0
            c2.tipo = "Lager"
            cerv.append(c2)
        }
        return cerv
    }
    
    @objc func botonAnadir(_ sender : UIButton) {
        let vnf = VistaNuevoFabricante()
        vnf.modalTransitionStyle = .flipHorizontal
        vnf.modalPresentationStyle = .formSheet
        present(vnf, animated: true, completion: nil)
    }
    
    @objc func botonEliminar(_ sender : UIButton) {
    }
}

class VistaNuevoFabricante : UIViewController {
    
    weak var vm = VistasMarcas()
    var constraints = [NSLayoutConstraint]()
    var etiqueta = UILabel()
    var botonHecho = UIButton()
    
    //VARIABLES DE PRUEBA
    //var fabricantes = [Fabricante]()
//    var fabricanteNuevo = Fabricante()
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
        botonHecho.addTarget(self, action: #selector(VistaNuevoFabricante.hecho), for: .touchUpInside)
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
            vm?.fabricantesNacionales.append(fabricanteNuevo) //Se llama a cargarDatos o algo así??
            vm?.tv.reloadData()
            dismiss(animated: true, completion: nil)
        }
        else
        {
            let fabricanteNuevo = Fabricante()
            fabricanteNuevo.nombre = campoNombre.text ?? "Sin nombre"
            fabricanteNuevo.pais = campoPais.text ?? "Sin país"
            fabricanteNuevo.creacion = Int(campoAno.text ?? "1900") ?? 1900
            vm?.fabricantesExtranjeros.append(fabricanteNuevo)
            vm?.tv.reloadData()
            dismiss(animated: true, completion: nil)
        }
    }
}

class VistaCervezas : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var vm = VistasMarcas()
    var tv = UITableView()
    var constraints = [NSLayoutConstraint]()
    var botonAtras = UIButton()
    var etiqueta = UILabel()
    var coleccionFabricantes = [Fabricante]()
    var tiposCerveza = [String]()
    var cervezasOrdenadas = [Cerveza]()
    var fabricante = Fabricante()
    var filasSeccion = [Int]()
    var i = 0
    var fila = 0
    
//    var orden = UIPickerView()
    
    override func loadView() {
        super.loadView()
        
        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
        view.backgroundColor = .white
        
        prepararTableView()
        prepararEtiqueta()
        prepararBoton()
//        prepararPickerView()
        prepararConstraints()
        
        view.addSubview(tv)
        view.addSubview(botonAtras)
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
        let vic = VistaIndividualCerveza()
        vic.modalTransitionStyle = .flipHorizontal
        vic.modalPresentationStyle = .currentContext
        vic.vc = self
        vic.cervezas = cervezasOrdenadas
        vic.tipos = tiposCerveza
        vic.seccion = indexPath.section
        vic.fila = indexPath.row
        vic.filasSec = filasSeccion
        present(vic, animated: true, completion: nil)
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
        botonAtras.addTarget(self, action: #selector(VistaCervezas.atras), for: .touchUpInside)
    }
    
    func prepararEtiqueta() {
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.textColor = .systemBrown
        etiqueta.textAlignment = .center
        etiqueta.text = "Listado de Cervezas de " //Añadir nombre de la marca
        etiqueta.font = UIFont(name: "Chalkduster", size: 20.0)
    }
    
//    func prepararPickerView() {
//        orden.translatesAutoresizingMaskIntoConstraints = false
//        orden.dataSource = self
//        orden.delegate = self
//        orden.numberOfComponents = 5
//    }
    
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
}

class VistaIndividualCerveza : UIViewController {
    
    weak var vc = VistaCervezas()
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
        botonAtras.addTarget(self, action: #selector(VistaIndividualCerveza.atras), for: .touchUpInside)
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
PlaygroundPage.current.liveView = VistasMarcas()
