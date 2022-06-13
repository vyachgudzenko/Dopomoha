//
//  NewQueryController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 05.06.2022.
//

import UIKit

struct QueryCellStruct{
    var title:String
    var image:UIImage
}


class NewQueryController: UIViewController {
    
    var typeAndCategories:[String:[QueryCellStruct]] = [
        "Материально":[
            QueryCellStruct(title: "Еда", image: UIImage(named: "dish")!),
            QueryCellStruct(title: "Лекарства", image: UIImage(named: "medicament")!),
            QueryCellStruct(title: "Гигиена", image: UIImage(named: "soap")!),
            QueryCellStruct(title: "Топливо", image: UIImage(named: "fuel")!),
            QueryCellStruct(title: "Оборудование", image: UIImage(named: "tools")!),
            QueryCellStruct(title: "Приют", image: UIImage(named: "shelter")!),
            QueryCellStruct(title: "Другое", image: UIImage(named: "more")!)],
        "Физически":[
            QueryCellStruct(title: "Рабочий", image: UIImage(named: "worker")!),
            QueryCellStruct(title: "Водитель", image: UIImage(named: "chauffeur")!),
            QueryCellStruct(title: "Доктор", image: UIImage(named: "doctor (1)")!),
            QueryCellStruct(title: "Другое", image: UIImage(named: "more")!)],
        "Морально":[
            QueryCellStruct(title: "Психотерапевт", image: UIImage(named: "mental-health")!),
            QueryCellStruct(title: "Друг", image: UIImage(named: "friend")!),
            QueryCellStruct(title: "Другое", image: UIImage(named: "more")!)]]
    
    var currentCategories:[QueryCellStruct] = []

    @IBOutlet weak var segmentedController: CustomSegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func segmentedControlChanged(_ sender:CustomSegmentedControl){
        currentCategories = typeAndCategories[segmentedController.selectedType]!
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCategories = typeAndCategories[segmentedController.selectedType]!
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        let cellNib = UINib(nibName: HelpQueryCell().identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: HelpQueryCell().identifier)
    }
}

extension NewQueryController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HelpQueryCell().identifier, for: indexPath) as! HelpQueryCell
        let currentCategory = currentCategories[indexPath.row]
        cell.setupCell(currentCategory)
        return cell
    }
    
    
}

extension NewQueryController:UITableViewDelegate{
    
}
