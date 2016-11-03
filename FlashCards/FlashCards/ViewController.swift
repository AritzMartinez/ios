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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Puesta a cero de los marcadores
        etiquetaBien.text = String(correctas)
        etiquetaMal.text = String(incorrectas)
        
        // Mostrar una pregunta al azar
        aleatorio = Int(arc4random_uniform(UInt32(tarjetas.getNumPreguntas())))
        etiquetaPregunta.text = tarjetas.getPregunta(numero: aleatorio)
        etiquetaRespuesta.text = ""
        
        // Desactivar los botones de respuesta
        botonBien.isEnabled = false;
        botonMal.isEnabled = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botonMostrar(_ sender: UIButton) {
        // Mostrar la respuesta
        etiquetaRespuesta.text = tarjetas.getRespuesta(numero:aleatorio)
        
        // Activar los botones
        botonBien.isEnabled = true;
        botonMal.isEnabled = true;
    }

    @IBAction func botonBien(_ sender: UIButton) {
        // Sumar 1
        correctas += 1;
        etiquetaBien.text = String(correctas)
        
        // Mostrar una pregunta al azar
        aleatorio = Int(arc4random_uniform(UInt32(tarjetas.getNumPreguntas())))
        etiquetaPregunta.text = tarjetas.getPregunta(numero:aleatorio)
        etiquetaRespuesta.text = ""
        
        // Desactivar los botones
        botonBien.isEnabled = false;
        botonMal.isEnabled = false;
    }
    
    @IBAction func botonMal(_ sender: UIButton) {
        // Sumar 1
        incorrectas += 1;
        etiquetaMal.text = String(incorrectas)
        
        // Mostrar una pregunta al azar
        aleatorio = Int(arc4random_uniform(UInt32(tarjetas.getNumPreguntas())))
        etiquetaPregunta.text = tarjetas.getPregunta(numero:aleatorio)
        etiquetaRespuesta.text = ""
        
        // Desactivar los botones
        botonBien.isEnabled = false;
        botonMal.isEnabled = false;
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
            etiquetaBien.text = String(correctas)
            etiquetaMal.text = String(incorrectas)
            
            // Mostrar una pregunta al azar
            aleatorio = Int(arc4random_uniform(UInt32(tarjetas.getNumPreguntas())))
            etiquetaPregunta.text = tarjetas.getPregunta(numero:aleatorio)
            etiquetaRespuesta.text = ""
            
            // Desactivar los botones
            botonBien.isEnabled = false;
            botonMal.isEnabled = false;
        }
    }
    
}

