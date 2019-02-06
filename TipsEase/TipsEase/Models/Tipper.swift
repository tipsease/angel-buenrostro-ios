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
    var id: Int? = nil
    var first_name, last_name, email, password: String
    var photo_url: String? = nil
    
    init(first_name: String, last_name: String, email: String, password: String) {
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.password = password
    }
}
