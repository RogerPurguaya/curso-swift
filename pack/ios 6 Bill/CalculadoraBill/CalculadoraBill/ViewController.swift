import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LBLRESOUESTA: UILabel!
    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    var nro1:Double = 0
    var nro2:Double = 0
    var res:Double = 0
    var lim:String=""
    var lim1:String=""
    var lim2:String=""
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnSum(_ sender: UIButton) {
        if txtNum1.text != "" || txtNum2.text != "" {
            nro1 = Double(txtNum1.text!)!
            nro2 = Double(txtNum2.text!)!
            res = nro1 + nro2
            LBLRESOUESTA.text = String(res)
        }else{
            LBLRESOUESTA.text = "Error :p"
        }
    }
    
    @IBAction func btnMen(_ sender: UIButton) {
        if txtNum1.text != "" || txtNum2.text != "" {
            nro1 = Double(txtNum1.text!)!
            nro2 = Double(txtNum2.text!)!
            res = nro1 - nro2
            LBLRESOUESTA.text = String(res)
        }else{
            LBLRESOUESTA.text = "Error :p"
        }
    }
    
    @IBAction func btnMult(_ sender: UIButton) {
        if txtNum1.text != "" || txtNum2.text != "" {
            nro1 = Double(txtNum1.text!)!
            nro2 = Double(txtNum2.text!)!
            res = nro1 * nro2
            LBLRESOUESTA.text = String(res)
        }else{
            LBLRESOUESTA.text = "Error :p"
        }
    }
    
    @IBAction func btnDiv(_ sender: UIButton) {
        if txtNum1.text != "" || txtNum2.text != "" {
            nro1 = Double(txtNum1.text!)!
            nro2 = Double(txtNum2.text!)!
            res = nro1 / nro2
            LBLRESOUESTA.text = String(res)
        }else{
            LBLRESOUESTA.text = "Error :p"
        }
    }
    
    @IBAction func btnLim(_ sender: UIButton) {
        LBLRESOUESTA.text = String(" ")
        txtNum1.text = String(" ")
        txtNum2.text = String(" ")
    }

}

