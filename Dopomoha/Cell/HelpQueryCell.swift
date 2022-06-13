//
//  HelpQueryCell.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 13.06.2022.
//

import UIKit

class HelpQueryCell: UITableViewCell {
    
    let identifier:String = "HelpQueryCell"
    
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(_ queryCellStruct:QueryCellStruct){
        typeLabel.text = queryCellStruct.title
        typeImage.image = queryCellStruct.image
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
