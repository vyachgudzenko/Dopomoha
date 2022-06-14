//
//  EditProfileController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 10.06.2022.
//

import UIKit

class EditProfileController: UIViewController {
    
    var user = User()

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var nameTextField: EditProfileTextField!
    @IBOutlet weak var phoneTextField: EditProfileTextField!
    @IBOutlet weak var donateSwitch: UISwitch!
    
    @IBAction
    private func saveChangeInProfie(_ sender:UIBarButtonItem){
        user.name = nameTextField.text
        user.phone = phoneTextField.text
        user.isAuthorized = true
        user.saveUserData()
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = UIImage(named: "profile.jpg")
        setupImageView(imageView: profileImage)
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        user.loadUserData()
        profileName.text = user.name ?? "User"
        nameTextField.text = user.name
        phoneTextField.text = user.phone
    }
    
    func setupImageView(imageView:UIImageView){
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderColor = UIColor.systemCyan.cgColor
        imageView.layer.borderWidth = 1
    }
}
