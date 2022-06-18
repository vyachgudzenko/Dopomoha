//
//  CustomAlert.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 18.06.2022.
//

import UIKit

enum OkButtonType{
    case authorization
    case confirm
}

protocol CustomAlertDelegate{
    func okButtonAction(_ alert:CustomAlert)
}

class CustomAlert: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var alertTitle = ""
    var alertMessage = ""
    var alertType:OkButtonType = .authorization
    
    var delegate:CustomAlertDelegate?
   
    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
        delegate?.okButtonAction(self)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    init(){
        super.init(nibName: "CustomAlert", bundle: Bundle(for: CustomAlert.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAlert(){
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        switch alertType {
        case .authorization:
            okButton.setTitle("Регистрация", for: .normal)
        case .confirm:
            okButton.setTitle("Помочь", for: .normal)
        }
    }
    
    func showAlert(title:String,message:String,okButtonType:OkButtonType){
        alertTitle = title
        alertMessage = message
        switch okButtonType {
        case .authorization:
            alertType = okButtonType
        case .confirm:
            alertType = okButtonType
        }
        
        if #available(iOS 13, *) {
        UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
        } else {
        UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
        // Do any additional setup after loading the view.
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
