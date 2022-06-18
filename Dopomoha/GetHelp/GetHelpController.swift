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
    }
    
    
    
    @IBAction func myHelpPressed(_ sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyHelpController")
        navigationController?.pushViewController(vc, animated: true)
        
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

extension GetHelpController:CustomAlertDelegate{
    func okButtonAction(_ alert: CustomAlert) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StartViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
