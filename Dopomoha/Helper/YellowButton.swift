//
//  YellowButton.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 14.06.2022.
//

import UIKit

class YellowButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 15
        layer.backgroundColor = UIColor.yellow.cgColor
    }

}
