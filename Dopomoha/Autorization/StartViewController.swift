//
//  StartViewController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 08.06.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBAction func buttonPressed(_ sender:UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let specifiedController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        navigationController?.pushViewController(specifiedController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
