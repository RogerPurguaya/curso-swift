


import UIKit

class crudJuegos: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var agregarActualizar: UIButton!
    @IBOutlet weak var juegoImage: UIImageView!
    
    @IBOutlet weak var txtCategoria: UILabel!
    
    var imagePicker = UIImagePickerController()
    var juego: Juego? = nil
    
    var list = ["colombianas","argentinas","mexicanas","venezolanas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        if  juego != nil {
            juegoImage.image = UIImage(data: (juego!.imagen!) as Data)
            titulo.text = juego!.titulo
            agregarActualizar.setTitle("Actualizar", for: .normal)
        }

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let titleRow = list[row]
        return titleRow
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            txtCategoria.text = list[row]
            dropDown.isHidden = false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
            dropDown.isHidden = false
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagenSeleccionada = info[UIImagePickerControllerOriginalImage] as! UIImage
        juegoImage.image = imagenSeleccionada
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func agregarTapped(_ sender: Any) {
        if juego != nil {
            juego!.titulo = titulo.text
            juego!.imagen = UIImagePNGRepresentation(juegoImage.image!) as NSData?
            juego!.categoria = txtCategoria.text
        }
        else{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let juego = Juego(context: context)
            juego.titulo = titulo.text
            juego.imagen = UIImagePNGRepresentation(juegoImage.image!) as NSData?
            juego.categoria = txtCategoria.text
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}



















