//
//  GetHelpController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 05.06.2022.
//

import UIKit

class GetHelpController: UIViewController {
    
    let dopomohaAlert = DopomohaAlert()

    @IBOutlet weak var button: YellowButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    func dismissAlert(){
        dopomohaAlert.dismissAlert()
    }
    
    
    @IBAction func myHelpPressed(_ sender: UIBarButtonItem) {
        /*let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyHelpController")
        navigationController?.pushViewController(vc, animated: true)*/
        dopomohaAlert.showAlert(title: "First message", messsage: "Its first message from custom alertController Its first message from custom alertController", viewController: self)
        
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
