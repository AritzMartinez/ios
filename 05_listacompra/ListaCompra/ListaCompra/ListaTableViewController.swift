//
//  ListaTableViewController.swift
//  ListaCompra
//
//  Created by Ion Jaureguialzo Sarasola on 23/11/17.
//  Copyright © 2017 Ion Jaureguialzo Sarasola. All rights reserved.
//

import UIKit

// Array con los items de la lista de la compra
var items = ["Galletas", "Fruta", "Cebollas (1)", "Pechuga de pollo"]

class ListaTableViewController: UITableViewController {

    // Mostrar el total de completados
    var completados = 0 {
        didSet {
            totalCompletados.title = NSLocalizedString("COMPLETADOS", comment: "") + ": \(completados)"
        }
    }

    @IBOutlet weak var totalCompletados: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Mostramos el botón de editar en la barra de navegación
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        // Mostramos el número de items completados
        completados = 0
    }

    // MARK: - Gestión del TableView

    // Número de secciones
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Número de filas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // Generar una fila de la tabla
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Instanciar la fila personalizada
        let fila = tableView.dequeueReusableCell(withIdentifier: "miCelda", for: indexPath) as! TableViewCell

        // Establecer la etiqueta y el tag del botón, para distinguirlo cuando lo pulsemos
        fila.etiqueta.text = items[indexPath.row] //+" -- \(indexPath.row)"
        fila.boton.tag = indexPath.row

        return fila
    }

    // ¿La fila es editable?
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Reaccionamos al botón de borrar de la fila
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            // Eliminamos el dato de la lista
            items.remove(at: indexPath.row)

            // Informamos a la tabla para que borre la fila
            tableView.deleteRows(at: [indexPath], with: .fade)

            // Recargamos para que se renumeren los items (esta parte es mejorable)
            tableView.reloadData()

        }
    }

    // Al reordenar las filas de la tabla, movemos los datos
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        // Extraemos el item original
        let itemMovido = items.remove(at: fromIndexPath.row)

        // Lo volvemos a colocar en la nueva posición
        items.insert(itemMovido, at: to.row)
    }

    // ¿Permitimos que un item se pueda reordenar?
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // MARK: - Añadir un item al TableView

    // Variable para recoger el dato en el unwind
    var nuevoItem: String?

    // Unwind desde NuevoItemViewController
    @IBAction func guardar(segue: UIStoryboardSegue) {
        if let nuevoItem = nuevoItem {
            items.append(nuevoItem)
            tableView.reloadData()
        }
    }

}
