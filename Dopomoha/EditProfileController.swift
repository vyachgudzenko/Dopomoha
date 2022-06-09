//
//  EditProfileController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 10.06.2022.
//

import UIKit

class EditProfileController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var donateSwitch: UISwitch!
    
    private func setupTextField(textField:UITextField){
        let color = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.5).cgColor
        textField.layer.borderWidth = 1
        textField.layer.borderColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField(textField: nameTextField)
        setupTextField(textField: phoneTextField)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
