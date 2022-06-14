//
//  CreateQueryController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 13.06.2022.
//

import UIKit

class CreateQueryController: UIViewController {
    
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
    }
    
    @IBAction func checkBoxChanged(_ sender: CheckBox) {
    }
    
    @IBAction func saveQueryButtonPressed(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = typeOfHelp
        contactView.layer.cornerRadius = 20
        textFieldAndButtonView.layer.cornerRadius = 20
    }
    
    private func setupButton(){
        
    }
}
