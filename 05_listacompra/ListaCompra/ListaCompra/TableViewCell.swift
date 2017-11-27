//
//  TableViewCell.swift
//  ListaCompra
//
//  Created by Ion Jaureguialzo Sarasola on 23/11/17.
//  Copyright © 2017 Ion Jaureguialzo Sarasola. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var boton: UIButton!

    @IBAction func completarItem(_ sender: UIButton) {

        // Quitar el item de la lista
        items.remove(at: boton.tag)

        // Recargar la tabla
        let tabla = self.superview as! UITableView
        tabla.reloadData()

        // Incrementar el número de completados
        let vc = tabla.delegate as! ListaTableViewController
        vc.completados += 1

    }

}
