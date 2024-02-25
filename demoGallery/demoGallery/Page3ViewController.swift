//
//  Page3ViewController.swift
//  demoGallery
//
//  Created by Jeremy Hua on 1/24/24.
//

import UIKit
import PhotosUI

class Page3ViewController: UIViewController,
                           UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var labelFromPage2: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    
    var receivedImage: UIImage?
    var receivedImage2: UIImage?
    
    var receivedText: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Make the image view circular
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true

        // Optional: Add a border
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.black.cgColor
        
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = self.view.bounds

                // Define the colors for your gradient (example uses a fade from blue to green)
                gradientLayer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]

                // Optionally define the locations of the gradient stops
        gradientLayer.locations = [0.0, 1.0]

                // Optionally define the direction of your gradient
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0) // Middle left
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1) // Middle right

                // Add the gradient layer to the view's layer
                self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        imageView.image = receivedImage
        imageView2.image = receivedImage2
        labelFromPage2.text = receivedText
        
        setupProfileImageViewTap()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupProfileImageViewTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
