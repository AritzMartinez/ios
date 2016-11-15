//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by widemos on 7/10/15.
//  Copyright © 2015 Ion Jaureguialzo Sarasola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var etiquetaAltura: UILabel!
    @IBOutlet weak var etiquetaPeso: UILabel!
    
    @IBOutlet weak var altura: UISlider!
    @IBOutlet weak var peso: UISlider!
    
    @IBOutlet weak var etiquetaIMC: UILabel!
    @IBOutlet weak var etiquetaExplicacion: UILabel!
    
    // Al cargar la aplicación ya hacemos el cálculo del IMC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcularIMC()
    }
    
    // Eventos de los dos sliders
    @IBAction func pesoChanged(_ sender: UISlider) {
        calcularIMC()
    }
    
    @IBAction func alturaChanged(_ sender: UISlider) {
        calcularIMC()
    }
    
    // Función que hace los cálculos y actualiza el interfaz
    func calcularIMC() {
        
        let a = altura.value
        etiquetaAltura.text = String(format: "%.2f m", a)
        let p = peso.value
        etiquetaPeso.text = String(format: "%.1f Kg", p)
        let imc = p/(a*a);
        etiquetaIMC.text = String(format: "%.1f", p/a/a)
        
        switch imc {
        case let i where i < 18.5:
            etiquetaExplicacion.text = "Peso inferior al normal"
        case let i where i >= 18.5 && i < 25:
            etiquetaExplicacion.text = "Normal"
        case let i where i >= 25 && i < 30:
            etiquetaExplicacion.text = "Peso superior al normal"
        case let i where i >= 30:
            etiquetaExplicacion.text = "Obesidad"
        default:
            etiquetaExplicacion.text = "?"
        }
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
}
