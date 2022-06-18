//
//  RoundImageView.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 17.06.2022.
//

import UIKit

class RoundImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }

}
