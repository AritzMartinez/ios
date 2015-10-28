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
        etiquetaPregunta.text = tarjetas.getPregunta(aleatorio)
        etiquetaRespuesta.text = ""
        
        // Desactivar los botones de respuesta
        botonBien.enabled = false;
        botonMal.enabled = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botonMostrar(sender: UIButton) {
        // Mostrar la respuesta
        etiquetaRespuesta.text = tarjetas.getRespuesta(aleatorio)
        
        // Activar los botones
        botonBien.enabled = true;
        botonMal.enabled = true;
    }

    @IBAction func botonBien(sender: UIButton) {
        // Sumar 1
        correctas++;
        etiquetaBien.text = String(correctas)
        
        // Mostrar una pregunta al azar
        aleatorio = Int(arc4random_uniform(UInt32(tarjetas.getNumPreguntas())))
        etiquetaPregunta.text = tarjetas.getPregunta(aleatorio)
        etiquetaRespuesta.text = ""
        
        // Desactivar los botones
        botonBien.enabled = false;
        botonMal.enabled = false;
    }
    
    @IBAction func botonMal(sender: UIButton) {
        // Sumar 1
        incorrectas++;
        etiquetaMal.text = String(incorrectas)
        
        // Mostrar una pregunta al azar
        aleatorio = Int(arc4random_uniform(UInt32(tarjetas.getNumPreguntas())))
        etiquetaPregunta.text = tarjetas.getPregunta(aleatorio)
        etiquetaRespuesta.text = ""
        
        // Desactivar los botones
        botonBien.enabled = false;
        botonMal.enabled = false;
    }

    
    // Reiniciar el interfaz de usuario al agitar el dispositivo
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event!.subtype == UIEventSubtype.MotionShake {
            
            // Puesta a cero de los marcadores
            correctas = 0
            incorrectas = 0
            etiquetaBien.text = String(correctas)
            etiquetaMal.text = String(incorrectas)
            
            // Mostrar una pregunta al azar
            aleatorio = Int(arc4random_uniform(UInt32(tarjetas.getNumPreguntas())))
            etiquetaPregunta.text = tarjetas.getPregunta(aleatorio)
            etiquetaRespuesta.text = ""
            
            // Desactivar los botones
            botonBien.enabled = false;
            botonMal.enabled = false;
        }
    }
    
}

