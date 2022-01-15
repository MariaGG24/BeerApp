//THIS IS THE MASTER BRANCH
import UIKit
import PlaygroundSupport

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
    var i = 0
    
    
    
    var fabricantes = [Fabricante]()
    var fabricantesNacionales = [Fabricante]()
    var fabricantesExtranjeros = [Fabricante]()
    
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
//        tv = UITableView(frame: UIScreen.main.bounds, style: .plain)
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
        //cell?.textLabel?.text = "\(indexPath.row)"
        if indexPath.section == 0
        {
            cell?.textLabel?.text = fabricantesNacionales[indexPath.row].nombre
        }
        else
        {
            cell?.textLabel?.text = fabricantesExtranjeros[indexPath.row].nombre
            i = i+1
        }
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = VistaCervezas()
        vc.modalPresentationStyle = .formSheet
        vc.modalTransitionStyle = .flipHorizontal
        vc.vm = self
        //vc.pais = indexPath.section
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
            fabricante.logo = nil
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
            c.logo = nil
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Mahou Mixta"
            c1.aporteCalorico = 29.0
            c1.graduacion = 0.9
            c1.tipo = "Radler"
            c1.logo = nil
            cerv.append(c1)
        }
        else if fab == "Estrella Galicia"
        {
            let c = Cerveza()
            c.nombre = "Estrella Galicia Especial"
            c.aporteCalorico = 47.0
            c.graduacion = 5.5
            c.tipo = "Lager Especial"
            c.logo = nil
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Estrella del Camino"
            c1.aporteCalorico = 46.0
            c1.graduacion = 5.3
            c1.tipo = "WITBIER"
            c1.logo = nil
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Estrella Galicia 00 Tostada"
            c2.aporteCalorico = 24.0
            c2.graduacion = 0.0
            c2.tipo = "Sin Alcohol"
            c2.logo = nil
            cerv.append(c2)
        }
        else if fab == "Heineken"
        {
            let c = Cerveza()
            c.nombre = "Heineken Original"
            c.aporteCalorico = 42.0
            c.graduacion = 5.0
            c.tipo = "Lager Pilsen Premium"
            c.logo = nil
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Heineken 0.0"
            c1.aporteCalorico = 21.0
            c1.graduacion = 0.0
            c1.tipo = "Sin Alcohol"
            c1.logo = nil
            cerv.append(c1)
        }
        else if fab == "Leffe"
        {
            let c = Cerveza()
            c.nombre = "Leffe Blonde"
            c.aporteCalorico = 42.0
            c.graduacion = 6.6
            c.tipo = "Pale Ale"
            c.logo = nil
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Leffe Ruby"
            c1.aporteCalorico = 55.0
            c1.graduacion = 5.0
            c1.tipo = "Lambic"
            c1.logo = nil
            cerv.append(c1)
        }
        else if fab == "Estrella Damm"
        {
            let c = Cerveza()
            c.nombre = "Voll-Damm"
            c.aporteCalorico = 66.0
            c.graduacion = 7.2
            c.tipo = "Märzenbier"
            c.logo = nil
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Equilater"
            c1.aporteCalorico = 75.0
            c1.graduacion = 11.0
            c1.tipo = "Imperial Stout"
            c1.logo = nil
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Malquerida"
            c2.aporteCalorico = 45.0
            c2.graduacion = 5.0
            c2.tipo = "Lager"
            c2.logo = nil
            cerv.append(c2)
        }
        else
        {
            let c = Cerveza()
            c.nombre = "Corona Extra"
            c.aporteCalorico = 42.0
            c.graduacion = 4.5
            c.tipo = "Lager"
            c.logo = nil
            cerv.append(c)
            
            let c1 = Cerveza()
            c1.nombre = "Budweiser"
            c1.aporteCalorico = 43.0
            c1.graduacion = 5.0
            c1.tipo = "Lager"
            c1.logo = nil
            cerv.append(c1)
            
            let c2 = Cerveza()
            c2.nombre = "Poker"
            c2.aporteCalorico = 142.0
            c2.graduacion = 4.0
            c2.tipo = "Lager"
            c2.logo = nil
            cerv.append(c2)
        }
        return cerv
    }
    
    @objc func botonAnadir(_ sender : UIButton) {
    }
    
    @objc func botonEliminar(_ sender : UIButton) {
    }
}

class VistaNuevoFabricante : UIViewController {
    
    weak var vm = VistasMarcas()
    var constraints = [NSLayoutConstraint]()
    var etiqueta = UILabel()
    var botonHecho = UIButton()
//    var fabricanteNuevo = Fabricante()
    
    override func loadView() {
        super.loadView()
        
        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
        view.backgroundColor = .white
        
        prepararEtiqueta()
        prepararBoton()
        prepararElementosAdicion()
        prepararConstraints()
        
        view.addSubview(etiqueta)
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
        botonHecho.setTitle("Atrás", for: .normal)
        botonHecho.setTitleColor(.blue, for: .normal)
        botonHecho.contentHorizontalAlignment = .center
        botonHecho.layer.cornerRadius = 4
        botonHecho.backgroundColor = .lightGray
        botonHecho.addTarget(self, action: #selector(VistaNuevoFabricante.hecho), for: .touchUpInside)
    }
    
    func prepararElementosAdicion() {
        //Poner aquí etiquetas con información a añadir
    }
    
    func prepararConstraints() {
        constraints.append(etiqueta.topAnchor.constraint(equalTo: view.topAnchor, constant: 10))
        constraints.append(etiqueta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108))
        constraints.append(etiqueta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108))
        
        constraints.append(botonHecho.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10))
        constraints.append(botonHecho.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
    }
    
    @objc func hecho(_ sender : UIButton){
        
    }
}

class VistaCervezas : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var vm = VistasMarcas()
    var tv = UITableView()
    var constraints = [NSLayoutConstraint]()
    var botonAtras = UIButton()
    var etiqueta = UILabel()
    var coleccionFabricantes = [Fabricante]()
    //var pais = 0
    
    //VARIABLES DE PRUEBA
    var tiposCerveza = [String]()
    
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
        
        prepararInformacionFabricante()
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cerveza")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 2
        return tiposCerveza.count
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        /*if section == 0
        {
            return "Tipo 1"
        }
        else
        {
            return "Tipo 2"
        }*/
        return tiposCerveza[section]
    }
    
    func prepararBotones() {
        botonAtras.translatesAutoresizingMaskIntoConstraints = false
        botonAtras.contentHorizontalAlignment = .center
        botonAtras.setTitle("Atrás", for: .normal)
        botonAtras.addTarget(self, action: #selector(VistaCervezas.atras), for: .touchUpInside)
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
    
    func prepararInformacionFabricante() {
        let fabricante = coleccionFabricantes[fila]
        var flag = Bool()
         
        for i in 0..<fabricante.cervezas!.count
        {
            flag = false
            for j in 0..<tiposCerveza.count
            {
                if tiposCerveza[j] == fabricante.cervezas![i].tipo
                {
                    flag = true
                    break
                }
            }
            if flag == false
            {
                tiposCerveza.append(fabricante.cervezas![i].tipo)
            }
        }
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
    var grad = Float()
    var graduacion = UILabel()
    var apCalorias = Float()
    var aporteCalorico = UILabel()
    var t = String()
    var tipo = UILabel()
    var iV = UIImageView()
    
    override func loadView() {
        super.loadView()
        
        view.frame = CGRect(x: 0, y: 0, width: 512, height: 512)
        view.backgroundColor = .white
        
        prepararEtiqueta()
        prepararBoton()
        prepararElementosInformacion()
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
        etiqueta.text = "Nombre de la cerveza"
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
        nombre.translatesAutoresizingMaskIntoConstraints = false
        nombre.text = "Nombre de la Cerveza"
        nombre.textAlignment = .center
        nombre.textColor = .systemBrown
        nombre.font = UIFont(name: "Chalkduster", size: 15.0)
        
        grad = 5.4
        graduacion.translatesAutoresizingMaskIntoConstraints = false
        graduacion.text = "Graduación de la Cerveza: " + String(grad)
        graduacion.textAlignment = .center
        graduacion.textColor = .systemBrown
        graduacion.font = UIFont(name: "Chalkduster", size: 15.0)
        
        apCalorias = 43.0
        aporteCalorico.translatesAutoresizingMaskIntoConstraints = false
        aporteCalorico.text = "Aporte calórico de la Cerveza: " + String(apCalorias)
        aporteCalorico.textAlignment = .center
        aporteCalorico.textColor = .systemBrown
        aporteCalorico.font = UIFont(name: "Chalkduster", size: 15.0)
        
        t = "IPA"
        tipo.translatesAutoresizingMaskIntoConstraints = false
        tipo.text = "Tipo de la Cerveza: " + t
        tipo.textAlignment = .center
        tipo.textColor = .systemBrown
        tipo.font = UIFont(name: "Chalkduster", size: 15.0)
        
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        iV.image = UIImage(named: "cerveza.jpg")
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
