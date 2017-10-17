//
//  Tarjetas.swift
//  FlashCards
//
//  Created by widemos on 28/10/15.
//  Copyright © 2015 Ion Jaureguialzo Sarasola. All rights reserved.
//

import Foundation

/// Contenedor de tarjetas con definiciones de palabras en chino.
struct Mazo {

    /**
     Tarjeta individual
     
     - anverso: Palabra en chino.
     - reverso: Palabra en castellano.
     */
    struct Tarjeta {
        let anverso: String
        let reverso: String
    }

    /**
     Array de tarjetas.
     
     Referencia: [Diccionario de chino YellowBridge](https://www.yellowbridge.com/chinese/dictionary.php)
     */
    let tarjetas = [
        Tarjeta(anverso: "男人", reverso: "Hombre"),
        Tarjeta(anverso: "女人", reverso: "Mujer"),
        Tarjeta(anverso: "日", reverso: "Sol"),
        Tarjeta(anverso: "月", reverso: "Luna"),
        Tarjeta(anverso: "猫", reverso: "Gato"),
        Tarjeta(anverso: "狗", reverso: "Perro"),
    ]

    /// Devuelve una tarjeta individual.
    subscript(index: Int) -> Tarjeta {
        return tarjetas[index]
    }

    /// Devuelve el número de tarjetas almacenadas
    var count: Int {
        return tarjetas.count
    }
}
