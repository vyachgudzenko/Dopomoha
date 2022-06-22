//
//  CustomSegmentedControl.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 11.06.2022.
//

import Foundation
import UIKit


class CustomSegmentedControl: UIControl {
    
    var buttons:[UIButton] = []
    var titles:[String] = ["One","two","three"]
    var selectedType:String?
    
    var selector:UIView?
    var sectorWidth:CGFloat?
    var textColor:UIColor = .white
    
    var selectorColor:UIColor = .yellow
    var selectorTextColor:UIColor = .tintColor
    var borderColor:UIColor = .systemCyan
    
    

    override func draw(_ rect: CGRect) {
        selectedType = titles[0]
        layer.backgroundColor = UIColor.clear.cgColor
        layer.cornerRadius = frame.height / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        updateViews()
        print(self.bounds)
    }
    
    func updateViews(){
        sectorWidth = frame.width / CGFloat(titles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: sectorWidth!, height: frame.height))
        selector?.layer.cornerRadius = (selector?.frame.height)! / 2
        selector?.backgroundColor = selectorColor
        addSubview(selector!)
        for (index, title) in titles.enumerated(){
            let button = UIButton(type: .system)
            button.frame = CGRect(x: sectorWidth! * CGFloat(index), y: 0, width: sectorWidth!, height: frame.height)
            button.contentMode = .scaleAspectFit
            button.setTitle(title, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            addSubview(button)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
    }
    
    @objc
    func buttonTapped(button:UIButton){
        for (btnIndex,btn) in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == button{
                selectedType = titles[btnIndex]
                UIView.animate(withDuration: 0.5) {
                    self.selector?.frame.origin.x = self.sectorWidth! * CGFloat(btnIndex)
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }
    
    
}


