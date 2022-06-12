//
//  CustomImageView.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 11.06.2022.
//

import UIKit

class CustomImageView: UIImageView {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor.systemCyan.cgColor
        self.layer.borderWidth = 1
    }

}
