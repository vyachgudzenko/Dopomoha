//
//  File.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 14.06.2022.
//

import Foundation

class User{
    
    var storage = UserDefaults.standard
    var name:String?
    var phone:String?
    var isAuthorized:Bool = false
    
    func saveUserData(){
        storage.set(name, forKey: "name")
        storage.set(phone, forKey: "phone")
        storage.set(isAuthorized, forKey: "isAuthorized")
    }
    
    func loadUserData(){
        name = storage.string(forKey: "name")
        phone = storage.string(forKey: "phone")
        isAuthorized = storage.bool(forKey: "isAuthorized")
    }
}
