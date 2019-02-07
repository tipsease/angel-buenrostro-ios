//
//  TipperController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

class TipperController: Codable {
    
    // changed to authentication endPoint
    let baseURL = URL(string: "https://tipsease-backend.herokuapp.com/api/tippers")!
    
    var tippers: [Tipper] = []
    var tipper: Tipper?
    var token: Token?
    var tips: [Tip] = []
    
    
    func loginTipper(email: String, password: String, tipperBoolean: Bool) -> Void{
        let tipperAuthentication = TipperLogin(email: email, password: password, tipperBoolean: tipperBoolean)
        print("tipper")
        var url = baseURL
        url.appendPathComponent("login")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        let postData = try! encoder.encode(tipperAuthentication)
        
        //    let postData = try! encoder.encode(tipper)
        request.httpBody = postData
        print("\(postData)")
        
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data not found")
                return
            }
//            print("The data unDecoded is: \(data)")
//            let decoder = JSONDecoder()
//            let dataDecoded = try! decoder.decode(loginResponse.self, from: data)
//            self.tipper = Tipper(first_name: dataDecoded.first_name, last_name: dataDecoded.last_name, email: dataDecoded.email)
//            print("The dataDecoded is: \(dataDecoded)")
            let httpResponse = response as? HTTPURLResponse
            print("This is the response:\(httpResponse!)")
            
            }.resume()
        print("tipper was sent to the DB")
    }
    
    
    
    func createTipper(first_name: String, last_name: String, email: String) -> Tipper{
        let tipper = Tipper(first_name: first_name, last_name: last_name, email: email)
        self.tippers.append(tipper)
        var url = baseURL.appendingPathComponent("tippers")
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        let postData = try! encoder.encode(tipper)
        request.httpBody = postData
        print("\(postData)")
        
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data not found")
                return
            }
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            
        }.resume()
        print("tipper was sent to the DB")
        return tipper
    }
    
    func allTippers(completion: @escaping(Error?)-> Void){
        let url = baseURL
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url){ (data, _, error) in
            if let error = error {
                print(error)
                completion(error)
                return
            }
            
            guard let data = data else {
                print("Error. No data returned")
                completion(error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let tipper = try decoder.decode([Tipper].self, from: data)
                print("tipper Count is: \(tipper.count)")
                self.tippers = tipper
                completion(nil)
            } catch {
                print("error decoding received data: \(error)")
                completion(error)
                return
        }
    }.resume()
    }
    
    
    func searchTips(id: Int, completion: @escaping(Error?)-> Void){
        let url = baseURL.appendingPathComponent("tippers").appendingPathComponent(String(id)).appendingPathComponent("tips")
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, _, error) in
            if let error = error {
                print(error)
                completion(error)
                return
            }
            
            guard let data = data else {
                print("Error. No data returned")
                completion(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                print(data)
                let tips = try decoder.decode([Tip].self, from: data)
                self.tips = tips
                print("The tips are!:\(self.tips)")
                completion(nil)
            } catch {
                print("error decoding received data: \(error)")
                completion(error)
                return
            }
            }.resume()
    }
    
    func searchTipper(id: Int, completion: @escaping(Error?)-> Void){
        let url = baseURL.appendingPathComponent("tippers").appendingPathComponent(String(id))
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ (data, _, error) in
            if let error = error {
                print(error)
                completion(error)
                return
            }
            
            guard let data = data else {
                print("Error. No data returned")
                completion(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                print(data)
                let tipper = try decoder.decode([Tipper].self, from: data)
                self.tippers = tipper
                completion(nil)
            } catch {
                print("error decoding received data: \(error)")
                completion(error)
                return
            }
            }.resume()
    }
    
    func updateTipper(id: Int, first_name: String?, last_name: String?, email: String?, photo_url: String?){
        var url = baseURL
        url.appendPathComponent("tippers")
        url.appendPathComponent(String(id))
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        searchTipper(id: id) { (error) in
            print("tipperToUpdate was called")
        }
        var tipperToUpdate = self.tippers[0]
//        tipperToUpdate.first_name =
//        tipperToUpdate.last_name =
//        tipperToUpdate.email =
//        tipperToUpdate.photo_url =
        
        let encoder = JSONEncoder()
        let postDate = try! encoder.encode(tipper)
    }
    
    func deleteTipper(){
        
    }
}
