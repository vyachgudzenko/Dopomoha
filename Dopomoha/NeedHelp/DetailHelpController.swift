//
//  DetailHelpController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 19.06.2022.
//

import UIKit

class DetailHelpController: UIViewController {

    var help:Help?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
    }
    
    private func setupView(){
        nameLabel.text = help?.typeHelp ?? ""
        distanceLabel.text = help?.distance ?? ""
        dateLabel.text = help?.date ?? ""
        descriptionLabel.text = help?.description ?? ""
        setupButton()
    }
    
    private func setupButton(){
        confirmButton.layer.cornerRadius = confirmButton.frame.size.height / 2
        confirmButton.layer.borderColor = UIColor.systemCyan.cgColor
        confirmButton.layer.borderWidth = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
}
