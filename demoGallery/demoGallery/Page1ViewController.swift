//
//  Page1ViewController.swift
//  demoGallery
//
//  Created by Jeremy Hua on 1/23/24.
//

import UIKit

class Page1ViewController: UIViewController {
    var selectedCollage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImageSelection()
    }
    
    @IBOutlet weak var collage4ImageView: UIImageView!
    @IBOutlet weak var collage3ImageView: UIImageView!
    
    @IBAction func page1savebutton(_ sender: UIButton) {
        print("Save button pressed. Selected collage: \(selectedCollage ?? "none")")
        if selectedCollage == "collage_4" {
            print("Performing segue to Page2")
            performSegue(withIdentifier: "toPage2", sender: self)
        } else {
            print("No segue performed")
        }
    }

    @IBAction func collage4tapped(_ sender: UITapGestureRecognizer) {
        selectedCollage = "collage_4"
        updateImageSelection()
    }

    @IBAction func collage3tapped(_ sender: UITapGestureRecognizer) {
        selectedCollage = "collage_3"
        updateImageSelection()
    }
    func updateImageSelection() {
        collage3ImageView.layer.borderWidth = (selectedCollage == "collage_3") ? 2 : 0
        collage3ImageView.layer.borderColor = (selectedCollage == "collage_3") ? UIColor.blue.cgColor : UIColor.clear.cgColor

        collage4ImageView.layer.borderWidth = (selectedCollage == "collage_4") ? 2 : 0
        collage4ImageView.layer.borderColor = (selectedCollage == "collage_4") ? UIColor.blue.cgColor : UIColor.clear.cgColor
    }

}
