//
//  ViewController.swift
//  FlashCards
//
//  Created by widemos on 28/10/15.
//  Copyright © 2015 Ion Jaureguialzo Sarasola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var etiquetaPregunta: UILabel!
    @IBOutlet weak var etiquetaRespuesta: UILabel!
    @IBOutlet weak var etiquetaBien: UILabel!
    @IBOutlet weak var etiquetaMal: UILabel!
    @IBOutlet weak var botonBien: UIButton!
    @IBOutlet weak var botonMal: UIButton!
    
    // Pregunta actual
    var aleatorio = 0
    
    // Modelo
    let tarjetas = Tarjetas()
    
    // Marcador
    var correctas = 0
    var incorrectas = 0
    
    // Mostrar una pregunta al azar
    func nuevaPregunta() {
        // Valor aleatorio entre 0 y tarjetas.count
        aleatorio = Int(arc4random_uniform(UInt32(tarjetas.count)))
        
        // Actualizar la vista
        etiquetaPregunta.text = tarjetas[aleatorio].anverso
        etiquetaRespuesta.text = ""
    }
    
    // Desactivar los botones de respuesta
    func botonesRespuesta( activados: Bool ) {
        botonBien.isEnabled = activados;
        botonMal.isEnabled = activados;
    }
    
    // Actualizar los dos marcadores
    func actualizarMarcador() {
        etiquetaBien.text = String(correctas)
        etiquetaMal.text = String(incorrectas)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actualizarMarcador()
        nuevaPregunta()
        botonesRespuesta(activados: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func botonMostrar(_ sender: UIButton) {
        // Mostrar la respuesta
        etiquetaRespuesta.text = tarjetas[aleatorio].reverso
        
        botonesRespuesta(activados: true)
    }
    
    @IBAction func botonBien(_ sender: UIButton) {
        // Sumar 1
        correctas += 1;
        
        actualizarMarcador()
        nuevaPregunta()
        botonesRespuesta(activados: false)
    }
    
    @IBAction func botonMal(_ sender: UIButton) {
        // Sumar 1
        incorrectas += 1;
        
        actualizarMarcador()
        nuevaPregunta()
        botonesRespuesta(activados: false)
    }
    
    // Reiniciar el interfaz de usuario al agitar el dispositivo
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event!.subtype == UIEventSubtype.motionShake {
            
            // Puesta a cero de los marcadores
            correctas = 0
            incorrectas = 0
            
            actualizarMarcador()
            nuevaPregunta()
            botonesRespuesta(activados: false)
        }
    }
    
}

