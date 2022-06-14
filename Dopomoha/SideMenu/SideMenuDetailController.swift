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

    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let cellNib = UINib(nibName: SideMenuCell().identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: SideMenuCell().identifier)
        profileImageView.image = UIImage(named: "profile.jpg")
        setupImageView(imageView: profileImageView)
    }
    
    func setupImageView(imageView:UIImageView){
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderColor = UIColor.systemCyan.cgColor
        imageView.layer.borderWidth = 1
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
