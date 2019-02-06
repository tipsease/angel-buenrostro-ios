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
    let id, start_date: Int
    let first_name, last_name, email, photo_url, tagline, qr_url: String
    
    init(id: Int, start_date: Int, first_name: String, last_name: String, email: String, photo_url: String, tagline: String, qr_url: String) {
        self.id = id
        self.start_date = start_date
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.photo_url = photo_url
        self.tagline = tagline
        self.qr_url = qr_url
    }
}
