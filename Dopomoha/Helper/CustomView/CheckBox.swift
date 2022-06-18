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
    
    var checkmarkImageView:UIImageView!
    
    @IBInspectable
    var checkImageColor:UIColor = .tintColor {
        didSet{
            tintColor = checkImageColor
        }
    }
    
    var isChecked:Bool = false {
        didSet{
            if isChecked{
                checkmarkImageView.image = checkmarkImage
            } else {
                checkmarkImageView.image = uncheckmarkImage
            }
        }
    }
    

    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.clear.cgColor
        checkmarkImageView = UIImageView(frame: rect)
        checkmarkImageView.image = uncheckmarkImage
        //checkmarkImageView.tintColor = .white
        addSubview(checkmarkImageView)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toggle))
        self.addGestureRecognizer(gesture)
    }
    
    @objc
    func toggle(){
        isChecked = !isChecked
        checkmarkImageView.setNeedsDisplay()
        sendActions(for: .valueChanged)
    }

}
