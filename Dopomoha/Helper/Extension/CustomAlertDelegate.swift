//
//  CustomAlertDelegate.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 18.06.2022.
//

import Foundation
import UIKit

extension UIViewController:CustomAlertDelegate{
    func okButtonAction(_ alert: CustomAlert) {
        switch alert.alertType{
        case .authorization:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "StartViewController")
            navigationController?.pushViewController(vc, animated: true)
        case .confirm:
            print("Add")
        }
    }
}
