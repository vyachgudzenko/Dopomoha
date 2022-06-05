//
//  HelpCell.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 06.06.2022.
//

import UIKit

class HelpCell: UICollectionViewCell {
    
    
    @IBOutlet weak var saveOurSoulsLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setupCell(help:Help){
        self.layer.cornerRadius = 15
        typeLabel.text = help.typeHelp
        distanceLabel.text = "\(help.distance) км."
        dateLabel.text = help.date
        descriptionLabel.text = help.description
        if help.isSOS{
            self.layer.borderColor = UIColor.red.cgColor
            self.layer.borderWidth = 1
        } else{
            saveOurSoulsLabel.isEnabled = false
        }
    }
}
