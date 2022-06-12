//
//  EditProfileController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 10.06.2022.
//

import UIKit

class EditProfileController: UIViewController {

    @IBOutlet weak var profileImage: CustomImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var nameTextField: EditProfileTextField!
    @IBOutlet weak var phoneTextField: EditProfileTextField!
    @IBOutlet weak var donateSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = UIImage(named: "profile.jpg")
        setupImageView(imageView: profileImage)
       

    }
    
    func setupImageView(imageView:UIImageView){
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderColor = UIColor.systemCyan.cgColor
        imageView.layer.borderWidth = 1
    }
}
