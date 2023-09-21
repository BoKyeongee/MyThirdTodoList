//
//  SimpleProfileViewModel.swift
//  MyApp2
//
//  Created by 보경 on 2023/09/22.
//

import Foundation

class SimpleProfileViewModel {
    var simpleUserInfo = SimpleProfile(userName: "남보경", userAge: 25) {
        didSet {
            self.simpleInfoDidChange?(simpleUserInfo)
        }
    }
    
    var simpleInfoDidChange: ((SimpleProfile) -> Void)?
}
