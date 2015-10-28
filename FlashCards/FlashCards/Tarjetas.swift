//
//  Tarjetas.swift
//  FlashCards
//
//  Created by widemos on 28/10/15.
//  Copyright © 2015 Ion Jaureguialzo Sarasola. All rights reserved.
//

import Foundation

class Tarjetas {
    
    let preguntas = [
        ("男人","hombre"),
        ("女人","mujer"),
        ("日","sol"),
        ("月","luna"),
        ("猫","gato"),
        ("狗","perro"),
    ]
    
    func getPregunta( numero: Int ) -> String {
        return preguntas[numero].0
    }
    
    func getRespuesta( numero: Int ) -> String {
        return preguntas[numero].1
    }
    
    func getNumPreguntas() -> Int {
        return preguntas.count
    }

}