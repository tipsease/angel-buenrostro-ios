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
    let first_name, last_name, email: String
    
    init(id: Int, first_name: String, last_name: String, email: String) {
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
    }
}
