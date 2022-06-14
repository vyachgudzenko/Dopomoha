//
//  DonateController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 07.06.2022.
//

import UIKit

class DonateController: UIViewController {
    
    let identifier = "DonateController"
    
    @IBOutlet weak var middleView: UIView!
    
    @IBOutlet weak var contributeButton: YellowButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        middleView.layer.cornerRadius = 20
    }
    
}
