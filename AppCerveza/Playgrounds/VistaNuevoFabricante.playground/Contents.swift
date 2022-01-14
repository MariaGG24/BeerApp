import UIKit
import PlaygroundSupport

class VistaNuevoFabricante : UIViewController {
    
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
PlaygroundPage.current.liveView = VistaNuevoFabricante()
