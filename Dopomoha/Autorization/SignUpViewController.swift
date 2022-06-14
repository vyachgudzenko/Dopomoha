//
//  SignUpViewController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 08.06.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextField()
        
    }
    
    @IBAction func buttonPressed(_ sender:UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupButton(){
        let color = UIColor(red: 0.992, green: 0.918, blue: 0.255, alpha: 1)
        loginButton.layer.borderColor = color.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 18
    }
    
    private func setupTextField(){
        let color = UIColor(red: 0.012, green: 0.667, blue: 0.965, alpha: 1)
        phoneTextField.layer.borderColor = color.cgColor
        phoneTextField.layer.borderWidth = 1
    }
}
