import UIKit
import PhotosUI

class Page2ViewController: UIViewController,
                      UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    var activeImageView: UIImageView?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageViewTap()
        setupSecondImageViewTap()
        textField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    private func setupImageViewTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupSecondImageViewTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondImageTapped(tapGestureRecognizer:)))
        imageView2.isUserInteractionEnabled = true
        imageView2.addGestureRecognizer(tapGestureRecognizer)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()  // Dismisses the keyboard
        return true
    }

    @IBOutlet weak var previewText: UILabel!
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        previewText.text = textField.text
        performSegue(withIdentifier: "toPage3", sender: self)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        activeImageView = imageView
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    @objc func secondImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        activeImageView = imageView2
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    // UIImagePickerControllerDelegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {  // Use the edited image
            activeImageView?.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPage3" {
            if let page3VC = segue.destination as? Page3ViewController {
                page3VC.receivedImage = imageView.image
                page3VC.receivedImage2 = imageView2.image
                page3VC.receivedText = textField.text
            }
        }
    }

}
