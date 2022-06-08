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
        SideMenuElement(title: "Обратная связь", image: UIImage(named: "email.png")!,controller: "FeedBackController"),
        SideMenuElement(title: "Поделиться", image: UIImage(named: "share.png")!,controller: "ShareController")
        ]

    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func buttnoPressed(_ sender: Any) {
        print("button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let cellNib = UINib(nibName: SideMenuCell().identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: SideMenuCell().identifier)
    }
    
    private func setupProfileImageView(){
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.cornerRadius = 20
        profileImageView.layer.borderColor = UIColor.systemCyan.cgColor
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
