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
    
    @IBOutlet weak var contributeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        middleView.layer.cornerRadius = 20
    }
    
    private func setupButton(){
        contributeButton.layer.cornerRadius = 15
    }
    
}
