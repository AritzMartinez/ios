//
//  Tarjetas.swift
//  FlashCards
//
//  Created by widemos on 28/10/15.
//  Copyright © 2015 Ion Jaureguialzo Sarasola. All rights reserved.
//

import Foundation

struct Tarjetas {
    
    struct Tarjeta {
        let anverso: String
        let reverso: String
    }
    
    // http://www.yellowbridge.com/chinese/dictionary.php
    let preguntas = [
        Tarjeta(anverso: "男人", reverso: "hombre"),
        Tarjeta(anverso: "女人", reverso: "mujer"),
        Tarjeta(anverso: "日", reverso: "sol"),
        Tarjeta(anverso: "月", reverso: "luna"),
        Tarjeta(anverso: "猫", reverso: "gato"),
        Tarjeta(anverso: "狗", reverso: "perro"),
        ]
    
    subscript(index: Int) -> Tarjeta {
        return preguntas[index]
    }
    
    var count: Int {
        return preguntas.count
    }
}
