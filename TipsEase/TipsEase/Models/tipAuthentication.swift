//
//  tipAuthentication.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/6/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

struct TipperAuthenticationTest : Codable {
    var tipperArray : [TipperLogin]
    
    init(tipperArray : [TipperLogin]){
        self.tipperArray = tipperArray
    }
}

struct TipperLogin: Codable, Equatable {
    var email: String
    var password: String
    var tipperBoolean : Bool
    
    init(email: String, password: String, tipperBoolean: Bool) {
        self.email = email
        self.password = password
        self.tipperBoolean = tipperBoolean
    }
}

struct Token: Codable, Equatable {
    var message: String? = nil
    var token: String
    
    init(token: String){
        self.token = token
    }
}

struct Tip: Codable, Equatable {
    var tipper_id: Int
    var amount: Double
    var date: Date
    
    init(tipper_id: Int, amount: Double, date: Date) {
        self.tipper_id = tipper_id
        self.amount = amount
        self.date = date
    }
}

struct loginResponse: Codable, Equatable {
    var success, token, first_name, last_name, photo_url, email, role: String
    var id: Int?
    var photo_public_id: Int?
    
    init(success: String, token: String, first_name: String, last_name: String, photo_url: String, email: String, role: String) {
        self.success = success
        self.token = token
        self.first_name = first_name
        self.last_name = last_name
        self.photo_url = photo_url
        self.email = email
        self.role = role
    }
}
