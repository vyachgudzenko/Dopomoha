//
//  NeedHelpController.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 06.06.2022.
//

import UIKit

struct Help{
    var typeHelp:String
    var description:String
    var distance:String
    var date:String
    var isSOS:Bool
}

class NeedHelpController: UIViewController {
    var currentDate = Date()
    
    var helpsList:[Help] = [
        Help(typeHelp: "Гигиена", description: "Нужен порошок, зубная паста sdfsdjfhskdfhskdjfhskfdhskfhjskdfhksdfhksdhfjkshjfksdhjfksjdhfskjdfhskdhfksdhfksjdhfksjhfksdjhfskjdhfksjdhfksjhfskdjhfkshdfks", distance: "44", date: "22 мая, 18:00" , isSOS: true),
        Help(typeHelp: "Материально", description: "Нужны деньги", distance: "102", date: " 01 июня, 12:00", isSOS: false),
        Help(typeHelp: "Транспорт", description: "Нужен транспорт, что бы перевести вещи", distance: "250", date: "10 мая, 9:00", isSOS: false)]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let cellNib = UINib(nibName: HelpPrototypeCell().identifier, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: HelpPrototypeCell().identifier)
        
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

extension NeedHelpController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return helpsList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HelpPrototypeCell", for: indexPath) as! HelpPrototypeCell
        let currentHelp = helpsList[indexPath.item]
        cell.setupCell(help: currentHelp)
        return cell
    }
    
    
}

extension NeedHelpController:UICollectionViewDelegate{
    
}

extension NeedHelpController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.bounds
        let widthCell = frameCV.width - 30.0
        let heightCell = frameCV.height / 4.0
        return CGSize(width: widthCell, height: heightCell)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}
