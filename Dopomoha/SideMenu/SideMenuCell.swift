//
//  SideMenuCell.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 07.06.2022.
//

import UIKit

class SideMenuCell: UITableViewCell {

    let identifier:String = "SideMenuCell"
   
    @IBOutlet weak var imageOfElement: UIImageView!
    
    @IBOutlet weak var labelOfElement: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(element:SideMenuElement){
        imageOfElement.image = element.image
        imageOfElement.tintColor = .red
        labelOfElement.text = element.title
    }
    
}
