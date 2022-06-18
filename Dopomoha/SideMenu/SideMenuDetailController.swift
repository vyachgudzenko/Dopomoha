//
//  SideMenuDetailController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 03.06.2022.
//

import UIKit

class SideMenuDetailController: UIViewController {
    
    var elementsOfSideMenuTable:[SideMenuElement] = [
        SideMenuElement(title: "О приложении", image: UIImage(named: "info.png")!,controller: "AboutController"),
        SideMenuElement(title: "Поддержать", image: UIImage(named: "dollar.png")!,controller: "DonateController"),
        SideMenuElement(title: "Обратная связь", image: UIImage(named: "email.png")!,controller: "FeedBackController")
        ]
    
    var user = User()

    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImageView: RoundImageView!
    
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func goToEditProfile(_ sender:UIButton){
        if user.isAuthorized{
            let editProfile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileController")
            navigationController?.pushViewController(editProfile, animated: true)
        } else {
            goToStart()
        }
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        if user.isAuthorized == false{
            goToStart()
        } else {
            user.isAuthorized = !user.isAuthorized
            setupProfileData()
        }
        
    }
    
    private func setupProfileData(){
        if user.isAuthorized{
            exitButton.setTitle("Выход", for: .normal)
            profileNameLabel.text = user.name
            phoneLabel.text = user.phone
            profileImageView.image = UIImage(named: "profile.jpg")
            editProfileButton.setTitle("", for: .normal)
        } else {
            exitButton.setTitle("Регистрация", for: .normal)
            profileNameLabel.text = ""
            phoneLabel.text = ""
            profileImageView.image = UIImage(systemName: "person")
            editProfileButton.setTitle("Регистрация", for: .normal)
            let image = UIImage()
            editProfileButton.setImage(image, for: .normal)
        }
    }
    
    private func goToStart(){
        let startVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartViewController")
        navigationController?.pushViewController(startVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let cellNib = UINib(nibName: SideMenuCell().identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: SideMenuCell().identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user.loadUserData()
        setupProfileData()
    }
}

extension SideMenuDetailController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementsOfSideMenuTable.count    
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell().identifier, for: indexPath) as! SideMenuCell
        let elementOfTable = elementsOfSideMenuTable[indexPath.row]
        cell.setupCell(element: elementOfTable)
        return cell
    }
}

extension SideMenuDetailController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let element = elementsOfSideMenuTable[indexPath.row]
        goToSpecifiedController(controller: element.controller)
        
    }
    
    private func goToSpecifiedController(controller:String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let specifiedController = storyboard.instantiateViewController(withIdentifier: controller)
        navigationController?.pushViewController(specifiedController, animated: true)
    }
}
