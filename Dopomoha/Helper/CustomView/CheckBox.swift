//
//  CheckBox.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 13.06.2022.
//

import UIKit

class CheckBox:UIControl {
    
    let checkmarkImage:UIImage = UIImage(systemName: "checkmark.square")!
    
    let uncheckmarkImage:UIImage = UIImage(systemName: "square")!
    
    var checkmarkImageView:UIImageView?
    
    @IBInspectable
    var checkImageColor:UIColor = .tintColor {
        didSet{
            tintColor = checkImageColor
        }
    }
    
    var isChecked:Bool = false
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.clear.cgColor
        checkmarkImageView = UIImageView(frame: rect)
        if isChecked {
            checkmarkImageView?.image = checkmarkImage
        } else {
            checkmarkImageView?.image = uncheckmarkImage
        }
        addSubview(checkmarkImageView!)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toggle))
        self.addGestureRecognizer(gesture)
    }
    
    @objc
    func toggle(){
        isChecked = !isChecked
        if isChecked{
            checkmarkImageView?.image = checkmarkImage
        } else {
            checkmarkImageView?.image = uncheckmarkImage
        }
        checkmarkImageView!.setNeedsDisplay()
        sendActions(for: .valueChanged)
    }

}
