//
//  CustomSegmentedControl.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 11.06.2022.
//

import Foundation
import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
    var buttons = [UIButton]()
    var selector:UIView!
    var selectedSegmentIndex:Int = 0
    
    
    @IBInspectable
    var borderWith:CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWith
        }
    }
    @IBInspectable
    var borderColor:UIColor = .clear {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable
    var commaSeparatedButtonTitles:String = "" {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var textColor:UIColor = .lightGray {
        didSet{
            updateView()
        }
    }
    @IBInspectable
    var selectorColor:UIColor = .darkGray {
        didSet{
            updateView()
        }
    }
    @IBInspectable
    var selectorTextColor:UIColor = .white{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        buttons.removeAll()
        subviews.forEach { view in
            view.removeFromSuperview()
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
        let selectorWidth = frame.width / CGFloat(buttons.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height / 2
        selector.backgroundColor = selectorColor
        addSubview(selector)
    }
    
    @objc
    func buttonTapped(button:UIButton){
        for (buttonIndex,btn) in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == button{
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.5) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }

}

