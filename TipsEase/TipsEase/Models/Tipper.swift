//
//  Tipper.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation



struct Tippers : Codable {
    var tipperArray : [Tipper]
    
    init(tipperArray : [Tipper]){
        self.tipperArray = tipperArray
    }
}

struct Tipper: Codable, Equatable {
    let id: Int
    let firstName, lastName, email: String
    let photoURL: String
    
    init(id: Int, firstName: String, lastName: String, email: String, photoURL: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.photoURL = photoURL
    }
}
