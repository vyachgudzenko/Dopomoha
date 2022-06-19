//
//  CustomNavigationBar.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 19.06.2022.
//

import Foundation
import UIKit

extension UIViewController{
    
    func createCustomNAvigationBar(){
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func createCustomTitleView(help:Help) -> UIView{
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 41)
        let typeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        typeLabel.text = help.typeHelp
        typeLabel.textColor = .yellow
        typeLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(typeLabel)
        
        let statusLabel = UILabel(frame: CGRect(x: 0, y: 21, width: 200, height: 20))
        statusLabel.text = "Открыта"
        statusLabel.textColor = .systemCyan
        statusLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(statusLabel)
        
        if help.isSOS{
            let sosLabel = UILabel(frame: CGRect(x: view.frame.width - 50, y: 10, width: 50, height: 20))
            sosLabel.text = "SOS"
            sosLabel.textColor = .red
            sosLabel.font = UIFont.systemFont(ofSize: 20)
            view.addSubview(sosLabel)
        }
        return view
    }
}
