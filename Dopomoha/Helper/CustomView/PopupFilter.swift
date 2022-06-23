//
//  PopupFilter.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 21.06.2022.
//

import Foundation
import UIKit

class PopupFilter{
    // Constants
    struct Constant{
        static let backgroundAlpha:CGFloat = 0.6
    }
    //View
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
    
    //elements of PopupView
    var sortSegmented:CustomSegmentedControl!
    var categorySegmented:CustomSegmentedControl!
    var distanceSlider:UISlider!
    var checkBox:CheckBox!
    
    //other
    var user = User()
    var isHidden:Bool = true
    
    func showPopup(viewController:UIViewController){
        guard let targetView = viewController.view else {
            return
        }
        
        myTargetView = targetView
        print(myTargetView?.frame)
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        let filterViewMultipier = 400 / targetView.frame.height
        
        popupFilter.frame = CGRect(x: 0, y: targetView.frame.height * 2, width: targetView.frame.width, height: targetView.frame.height * filterViewMultipier)
        popupFilter.translatesAutoresizingMaskIntoConstraints = false
        targetView.addSubview(popupFilter)
        createNeedHelpFilter()
        UIView.animate(withDuration: 0.2) {
            self.backgroundView.alpha = Constant.backgroundAlpha
        } completion: { done in
            if done{
                UIView.animate(withDuration: 0.5) {
                    self.popupFilter.frame = CGRect(x: 0, y: targetView.frame.height - (targetView.frame.height * filterViewMultipier) - 30, width: targetView.frame.width, height: targetView.frame.height * filterViewMultipier)
                }
            }
        }

    }
    
    func dismissPopupFilter(){
        guard let targetView = myTargetView else {
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            self.popupFilter.frame = CGRect(x: 40, y: targetView.frame.size.height, width: targetView.frame.size.width - 80, height: 300)
        } completion: { done in
            if done{
                UIView.animate(withDuration: 0.25) {
                    self.backgroundView.alpha = 0
                } completion: { done in
                    if done{
                        self.popupFilter.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    func createNeedHelpFilter(){
        user.loadFilter()
        let marginX:CGFloat = 10
        let marginY:CGFloat = 10
        let widthWithMargin = popupFilter.frame.width - marginY * 2
        
        let filterLabel = UILabel(frame: CGRect(x: marginX, y: marginY, width: widthWithMargin, height: 20))
        filterLabel.text = "Фильтр"
        filterLabel.textColor = .white
        filterLabel.font = UIFont.systemFont(ofSize: 20)
        filterLabel.textAlignment = .center
        popupFilter.addSubview(filterLabel)
        
        let sortLabel = UILabel(frame: CGRect(x: marginX, y: 40, width: widthWithMargin, height: 20))
        sortLabel.text = "Сортировка"
        sortLabel.textColor = .lightGray
        sortLabel.font = UIFont.systemFont(ofSize: 16)
        sortLabel.textAlignment = .center
        popupFilter.addSubview(sortLabel)
        
        sortSegmented = CustomSegmentedControl(frame: CGRect(x: marginX, y: 70, width: widthWithMargin - 80, height: 40))
        sortSegmented.center.x = popupFilter.center.x
        sortSegmented.titles = ["Ближайшие","Новейшие","Давние"]
        sortSegmented.selectedType = user.sortFilter ?? sortSegmented.titles.first
        popupFilter.addSubview(sortSegmented!)
        
        let categoryLabel = UILabel(frame: CGRect(x: marginX, y: 120, width: widthWithMargin, height: 20))
        categoryLabel.text = "Категория"
        categoryLabel.textColor = .lightGray
        categoryLabel.font = UIFont.systemFont(ofSize: 16)
        categoryLabel.textAlignment = .center
        popupFilter.addSubview(categoryLabel)
        
        categorySegmented = CustomSegmentedControl(frame: CGRect(x: marginX, y: 150, width: widthWithMargin, height: 40))
        categorySegmented.center.x = popupFilter.center.x
        categorySegmented.titles = ["Все","Материальная","Физическая","Моральная"]
        categorySegmented.selectedType = user.categoryFilter ?? categorySegmented.titles.first
        popupFilter.addSubview(categorySegmented!)
        
        let distanceLabel = UILabel(frame: CGRect(x: marginX, y: 200, width: widthWithMargin, height: 20))
        distanceLabel.text = "Радиус поиска (км)"
        distanceLabel.textColor = .lightGray
        distanceLabel.font = UIFont.systemFont(ofSize: 16)
        distanceLabel.textAlignment = .center
        popupFilter.addSubview(distanceLabel)
        
        distanceSlider = UISlider(frame: CGRect(x: marginX, y: 230, width: widthWithMargin, height: 30))
        distanceSlider.minimumValue = 0
        distanceSlider.maximumValue = 500
        distanceSlider.setValue(user.distanceFilter ?? 500, animated: true)
        distanceSlider.minimumTrackTintColor = .systemCyan
        distanceSlider.thumbTintColor = .systemCyan
        distanceSlider.maximumTrackTintColor = .lightGray
        popupFilter.addSubview(distanceSlider)
        
        checkBox = CheckBox(frame: CGRect(x: marginX, y: 270, width: 30, height: 30))
        checkBox.checkImageColor = .red
        checkBox.isChecked = user.sosFIlter ?? false
        popupFilter.addSubview(checkBox)
        
        let sosLabel = UILabel(frame: CGRect(x: 50, y: 275, width: 200, height: 20))
        sosLabel.text = "Только срочные"
        sosLabel.textColor = .red
        sosLabel.font = UIFont.systemFont(ofSize: 16)
        sosLabel.textAlignment = .left
        popupFilter.addSubview(sosLabel)
        
        var buttons:[UIButton] = []
        let cancelButton = UIButton(type: .system)
        cancelButton.tintColor = .red
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        buttons.append(cancelButton)
        
        let okButton = UIButton(type: .system)
        okButton.tintColor = .green
        okButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        buttons.append(okButton)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.frame = CGRect(x: popupFilter.frame.width / 3, y: 310, width: popupFilter.frame.width / 3, height: 50)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        popupFilter.addSubview(stackView)
        
    }
    
    @objc
    func cancelButtonTapped(){
        self.isHidden = true
        self.dismissPopupFilter()
    }
    
    @objc
    func okButtonTapped(){
        user.sortFilter = sortSegmented.selectedType
        user.categoryFilter = categorySegmented.selectedType
        user.distanceFilter = distanceSlider.value
        user.sosFIlter = checkBox.isChecked
        user.saveFilter()
        self.isHidden = true
        self.dismissPopupFilter()
    }
    
}
