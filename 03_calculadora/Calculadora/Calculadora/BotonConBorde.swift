//
// Botón con borde basado en http://stackoverflow.com/a/38154358
//

import UIKit

@IBDesignable class BotonConBorde: UIButton {

    @IBInspectable var ancho: CGFloat = 0 {
        didSet {
            layer.borderWidth = ancho
        }
    }

    @IBInspectable var color: UIColor? {
        didSet {
            if ancho > 0 {
                layer.borderColor = color?.cgColor
            }
        }
    }

    @IBInspectable var radio: CGFloat = 0 {
        didSet {
            if !circular {
                layer.cornerRadius = radio
            }
        }
    }

    @IBInspectable var circular: Bool = false {
        didSet {
            setNeedsLayout() // Sin esto no se refresca el IB
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if circular {
            layer.cornerRadius = layer.frame.height / 2
        }

        clipsToBounds = true
    }
}
