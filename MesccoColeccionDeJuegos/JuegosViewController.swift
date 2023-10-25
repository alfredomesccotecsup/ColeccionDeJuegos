//
//  JuegosViewController.swift
//  MesccoColeccionDeJuegos
//
//  Created by Mescco Quiespe, Rosendo Alfredo on 24/10/23.
//

import UIKit

class JuegosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var JuegoimageView: UIImageView!
    
    @IBOutlet weak var tituloTextFIeld: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self


    }
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true,
        completion: nil)
    }
    
    @IBAction func camaraTapped(_ sender: Any) {
    }
    
    @IBAction func agregarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as!
                       AppDelegate).persistentContainer.viewContext
        let juego = Juego(context: context)
        juego.titulo = tituloTextFIeld.text
        juego.imagen = JuegoimageView.image?.jpegData(compressionQuality: 0.50)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagenSeleccionada = info[.originalImage] as? UIImage
        JuegoimageView.image = imagenSeleccionada
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
