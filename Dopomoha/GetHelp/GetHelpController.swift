//
//  GetHelpController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 05.06.2022.
//

import UIKit

class GetHelpController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()

        
       
    }
    

    func setupButton(){
        button.layer.backgroundColor = UIColor.yellow.cgColor
        button.layer.cornerRadius = 15
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("pressed")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
