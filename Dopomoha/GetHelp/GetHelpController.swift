//
//  GetHelpController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 05.06.2022.
//

import UIKit

class GetHelpController: UIViewController {

    @IBOutlet weak var button: YellowButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.tintColor = .yellow
    }
    
    @IBAction func createNewQuery(_ sender:UIButton){
        let alert = CustomAlert()
        alert.delegate = self
        alert.showAlert(title: "sfsdfs", message: "dgfdgdfgdfg", okButtonType: .authorization)
    }
    
    
    @IBAction func myHelpPressed(_ sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyHelpController")
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
