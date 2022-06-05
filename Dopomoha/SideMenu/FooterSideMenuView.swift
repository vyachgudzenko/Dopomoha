//
//  FooterSideMenuView.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 04.06.2022.
//

import UIKit

class FooterSideMenuView: UIView {
    
    var isLogIn:Bool = true
    
    @IBOutlet var LogOutBtn:UIButton!

    @IBAction func btnPressed(_ sender:UIButton){
        print("Change log")
    }

}
