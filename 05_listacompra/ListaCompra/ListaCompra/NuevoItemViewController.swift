//
//  NuevoItemViewController.swift
//  ListaCompra
//
//  Created by Ion Jaureguialzo Sarasola on 27/11/17.
//  Copyright © 2017 Ion Jaureguialzo Sarasola. All rights reserved.
//

import UIKit

class NuevoItemViewController: UIViewController {

    @IBOutlet weak var textoNuevoItem: UITextField!

    // MARK: - Navegación

    // Al pulsar el botón de guardar, pasar los datos de vuelta
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "guardarNuevoItem" {
            let vc = segue.destination as! ListaTableViewController

            vc.nuevoItem = textoNuevoItem.text
        }

    }

}
