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
