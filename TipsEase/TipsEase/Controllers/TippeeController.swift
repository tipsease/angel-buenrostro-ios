//
//  TippeeController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

class TippeeController: Codable {
    
    let baseURL = URL(string: "https://tipsease-david-freitag-backend.herokuapp.com/api/tippees/")!
    
    var tippees: [Tippee] = []
    var tippee: Tippee?
    
    func createTippee(id: Int, start_date: Int, first_name: String, last_name: String, email: String, photo_url: String, tagline: String, qr_url: String) -> Tippee{
        let tippee = Tippee(id: id, start_date: start_date, first_name: first_name, last_name: last_name, email: email, photo_url: photo_url, tagline: tagline, qr_url: qr_url)
        self.tippees.append(tippee)
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let postData = try! encoder.encode(tippee)
        
        URLSession.shared.dataTask(with: request){
            (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data not found")
                return
            }
            do {
                let encoder = JSONEncoder()
                let tippee = try encoder.encode(data)
            } catch {
                
            }
            
        }
        return tippee
    }
    
    func deleteTippee(){
        
    }
    
    func allTippees(completion: @escaping(Error?)-> Void){
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
                let tippee = try decoder.decode([Tippee].self, from: data)
                self.tippees = tippee
                completion(nil)
            } catch {
                print("error decoding received data: \(error)")
                completion(error)
                return
            }
            }.resume()
    }
    
    func searchTippee(id: Int, completion: @escaping(Error?)-> Void){
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
                let tippee = try decoder.decode([Tippee].self, from: data)
                self.tippees = tippee
                completion(nil)
            } catch {
                print("error decoding received data: \(error)")
                completion(error)
                return
            }
            }.resume()
    }
}
