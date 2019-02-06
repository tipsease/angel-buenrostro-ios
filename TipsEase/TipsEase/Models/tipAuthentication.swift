//
//  tipAuthentication.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/6/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

struct TipperAuthenticationTest : Codable {
    var tipperArray : [TipperTest]
    
    init(tipperArray : [TipperTest]){
        self.tipperArray = tipperArray
    }
}

struct TipperTest: Codable, Equatable {
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
