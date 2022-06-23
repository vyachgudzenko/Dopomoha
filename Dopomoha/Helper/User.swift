//
//  User.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 23.06.2022.
//

import Foundation
class User{
    
    var storage = UserDefaults.standard
    var name:String?
    var phone:String?
    var imageName:String?
    var isAuthorized:Bool = true
    var hasImage:Bool = false
    
    var sortFilter:String?
    var categoryFilter:String?
    var distanceFilter:Float?
    var sosFIlter:Bool?
    
    func saveUserData(){
        storage.set(name, forKey: "name")
        storage.set(phone, forKey: "phone")
        storage.set(isAuthorized, forKey: "isAuthorized")
        storage.set(imageName, forKey: "imageName")
        storage.set(hasImage, forKey: "hasImage")
    }
    
    func saveFilter(){
        storage.set(sortFilter, forKey: "sortFilter")
        storage.set(categoryFilter, forKey: "categoryFilter")
        storage.set(distanceFilter, forKey: "distanceFilter")
        storage.set(sosFIlter, forKey: "sosFIlter")
    }
    
    func loadUserData(){
        name = storage.string(forKey: "name")
        phone = storage.string(forKey: "phone")
        isAuthorized = storage.bool(forKey: "isAuthorized")
        imageName = storage.string(forKey: "imageName")
        hasImage = storage.bool(forKey: "hasImage")
    }
    
    func loadFilter(){
        sortFilter = storage.string(forKey: "sortFilter")
        categoryFilter = storage.string(forKey: "categoryFilter")
        distanceFilter = storage.float(forKey: "distanceFilter")
        sosFIlter = storage.bool(forKey: "sosFIlter")
    }
}
