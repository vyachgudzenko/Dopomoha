//
//  CreateQueryController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 13.06.2022.
//

import UIKit

class CreateQueryController: UIViewController {
    
    var user = User()
    
    var typeOfHelp:String?
    @IBOutlet var contactView:UIView!
    @IBOutlet weak var textFieldAndButtonView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var textField: EditProfileTextField!
    
    
    @IBOutlet weak var saveQueryButton: YellowButton!
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var hidePhoneSwitch: UISwitch!
    
    
    @IBAction func swithChanged(_ sender: UISwitch) {
        if hidePhoneSwitch.isOn{
            phoneLabel.isEnabled = false
        } else {
            phoneLabel.isEnabled = true
        }
    }
    
    @IBAction func checkBoxChanged(_ sender: CheckBox) {
        
    }
    
    @IBAction func saveQueryButtonPressed(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = typeOfHelp
        contactView.layer.cornerRadius = 20
        textFieldAndButtonView.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user.loadUserData()
        nameLabel.text = user.name
        phoneLabel.text = user.phone
    }
    
    private func setupButton(){
        
    }
}
