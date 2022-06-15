//
//  CustomAlert.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 15.06.2022.
//

import Foundation
import UIKit

class DopomohaAlert{
    
    struct Constant{
        static let backgroundAlpha:CGFloat = 0.6
    }
    
    private var myTargetView:UIView?
    
    private let backgroundView:UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView:UIView =  {
        let alert = UIView()
        let color = UIColor(red: 0.161, green: 0.278, blue: 0.369, alpha: 1)
        alert.backgroundColor = color
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 15
        return alert
    }()
    
    func showAlert(title:String, messsage: String, viewController:UIViewController){
        guard let targetView = viewController.view else {
            return
        }
        
        myTargetView = targetView
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        
        alertView.frame = CGRect(x: 40, y: -300, width: targetView.frame.size.width - 80, height: 300)
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 10, width: 50, height: 50))
        imageView.image = UIImage(systemName: "heart")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .yellow
        alertView.addSubview(imageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 80, y: 0, width:alertView.frame.size.width, height: 80))
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 80, width:alertView.frame.size.width - 20, height: 170))
        messageLabel.numberOfLines = 0
        messageLabel.text = messsage
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        alertView.addSubview(messageLabel)
        
        let doneButton = UIButton()
        doneButton.setTitle("Cancel", for: .normal)
        doneButton.setTitleColor(.systemCyan, for: .normal)
        doneButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        let cancelButton = UIButton()
        cancelButton.setTitle("Dismiss", for: .normal)
        cancelButton.setTitleColor(.systemCyan, for: .normal)
        cancelButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        let buttons = [doneButton,cancelButton]
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.frame = CGRect(x: 0, y: alertView.frame.height - 50, width: alertView.frame.width, height: 50)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        alertView.addSubview(stackView)
        
        
        
        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = Constant.backgroundAlpha
        } completion: { done in
            if done{
                UIView.animate(withDuration: 0.25) {
                    self.alertView.center = targetView.center
                }
            }
        }

    }
    
    @objc
    func dismissAlert(){
        guard let targetView = myTargetView else {
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            self.alertView.frame = CGRect(x: 40, y: targetView.frame.size.height, width: targetView.frame.size.width - 80, height: 300)
        } completion: { done in
            if done{
                UIView.animate(withDuration: 0.25) {
                    self.backgroundView.alpha = 0
                } completion: { done in
                    if done{
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                    }
                }

            }
        }

    }
}
