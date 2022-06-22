//
//  GetHelpController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 05.06.2022.
//

import UIKit

class GetHelpController: UIViewController {
    
    let user = User()

    @IBOutlet weak var button: YellowButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.loadUserData()
        
    }
    
    @IBAction func createNewQuery(_ sender:UIButton){
        user.isAuthorized = true
        if user.isAuthorized{
            let newQueryController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewQueryController")
            navigationController?.pushViewController(newQueryController, animated: true)
        } else{
            let alert = CustomAlert()
            alert.delegate = self
            alert.showAlert(title: "Вы не зарегистрирован", message: "Для того, что бы создать заявку нужно зарегистрироваться. Это займет буквально пару минут", okButtonType: .authorization)
        }
    }
    
    
    @IBAction func myHelpPressed(_ sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyHelpController")
        navigationController?.pushViewController(vc, animated: true)
     }
}
