//
//  PopupFilter.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 21.06.2022.
//

import Foundation
import UIKit

class PopupFilter{
    struct Constant{
        static let backgroundAlpha:CGFloat = 0.6
    }
    
    private var myTargetView:UIView?
    
    private var backgroundView:UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private var popupFilter:UIView = {
        let popupFilter = UIView()
        let color = UIColor(red: 0.161, green: 0.278, blue: 0.369, alpha: 1)
        popupFilter.backgroundColor = color
        popupFilter.layer.masksToBounds = true
        popupFilter.layer.cornerRadius = 15
        return popupFilter
    }()
    
    func showPopup(viewController:UIViewController){
        guard let targetView = viewController.view else {
            return
        }
        
        myTargetView = targetView
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        popupFilter.frame = CGRect(x: 0, y: targetView.frame.height * 2, width: targetView.frame.width, height: targetView.frame.height / 2)
        popupFilter.translatesAutoresizingMaskIntoConstraints = false
        targetView.addSubview(popupFilter)
        createNeedHelpFilter()
        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = Constant.backgroundAlpha
        } completion: { done in
            if done{
                UIView.animate(withDuration: 0.5) {
                    self.popupFilter.frame = CGRect(x: 0, y: targetView.frame.height / 2, width: targetView.frame.width, height: targetView.frame.height / 2)
                }
            }
        }

    }
    
    func createNeedHelpFilter(){
        let marginX:CGFloat = 10
        let marginY:CGFloat = 10
        let widthWithMargin = popupFilter.frame.width - marginY * 2
        
        let filterLabel = UILabel(frame: CGRect(x: marginX, y: marginY, width: widthWithMargin, height: 20))
        filterLabel.text = "Фильтр"
        filterLabel.textColor = .white
        filterLabel.font = UIFont.systemFont(ofSize: 20)
        filterLabel.textAlignment = .center
        popupFilter.addSubview(filterLabel)
        
        let sortLabel = UILabel(frame: CGRect(x: marginX, y: marginY + filterLabel.frame.height + 1, width: widthWithMargin, height: 20))
        sortLabel.text = "Сортировка"
        sortLabel.textColor = .lightGray
        sortLabel.font = UIFont.systemFont(ofSize: 16)
        sortLabel.textAlignment = .center
        popupFilter.addSubview(sortLabel)
        
        let sortSegmented = CustomSegmentedControl(frame: CGRect(x: marginX, y: sortLabel.frame.origin.y + sortLabel.frame.height + 1, width: widthWithMargin, height: 50))
        sortSegmented.borderWith = 1
        sortSegmented.borderColor = .yellow
        sortSegmented.categories = ["Ближайшие","Новейшие","Давние"]
        sortSegmented.selectorColor = .clear
        popupFilter.addSubview(sortSegmented)
        
    }
    
    
}
