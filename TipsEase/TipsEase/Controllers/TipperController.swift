//
//  TipperController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

class TipperController: Codable {
    
    let baseURL = URL(string: "https://tipsease-david-freitag-backend.herokuapp.com/api/tippers/")!
    
    var tippers: [Tipper] = []
    var tipper: Tipper?
    
    func createTipper(first_name: String, last_name: String, email: String) -> Tipper{
        let tipper = Tipper(first_name: first_name, last_name: last_name, email: email)
        self.tippers.append(tipper)
        
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
    
    func deleteTipper(){
        
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
                self.tippers = tipper
                completion(nil)
            } catch {
                print("error decoding received data: \(error)")
                completion(error)
                return
        }
    }.resume()
    }
    
    func searchTipper(id: Int, completion: @escaping(Error?)-> Void){
        let url = baseURL.appendingPathComponent(String(id))
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
}
