//
//  Tippee.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

struct Tippees : Codable {
    var tippeeArray : [Tippee]
    
    init(tippeeArray : [Tippee]){
        self.tippeeArray = tippeeArray
    }
}

struct Tippee: Codable, Equatable {
    var id: Int? = nil
    var start_date: Date
    var first_name, last_name, email, tagline: String
    var photo_url: String? = nil
    var qr_url: String? = nil
    
    init(start_date: Date, first_name: String, last_name: String, email: String, tagline: String) {
        self.start_date = start_date
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.tagline = tagline
    }
}
