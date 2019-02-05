//
//  TipperController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

class TipperController: Codable {
    
    let baseURL = URL(string: "https://tipsease.insanechaos.com/api/tippers")
    
    var tippers: [Tipper] = []
    var tipper: Tipper?
    
    func createTipper(id: Int, first_name: String, last_name: String, email: String) -> Tipper{
        let tipper = Tipper(id: id, first_name: first_name, last_name: last_name, email: email)
        self.tippers.append(tipper)
        
        var url = baseURL?.appendingPathComponent("tippers")
        
        return tipper
    }
    
    func deleteTipper(){
        
    }
    
    func searchTipper(){
        
    }
}
