//
//  EditProfileTextField.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 10.06.2022.
//

import UIKit

class EditProfileTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let color = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.5)
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
    
}

