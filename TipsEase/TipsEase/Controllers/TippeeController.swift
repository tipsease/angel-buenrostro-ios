//
//  TippeeController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation


// authentication dummy data:

class TippeeController: Codable {
    
    let baseURL = URL(string: "https://tipsease-backend.herokuapp.com/api/tippees")!
    
    var tippees: [Tippee] = []
    var tippee: Tippee?
    
    func createTip(tippee_id: Int, tipper_id: Int, amount: Double, date: Date) -> Tip{
        let tip = Tip(tipper_id: tipper_id, amount: amount, date: date)
        var url = baseURL
        url.appendPathComponent(String(tippee_id))
        url.appendPathComponent("tips")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let postData = try! encoder.encode(tip)
        request.httpBody = postData
        print("This is where the tip was made")
        
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
            print("This is the tip data:\(data)")
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }.resume()
        print("tip was sent to DB")
        return tip
    }
    
    /* THIS IS TO CREATE DAVID'S TIPPEE
    func createTippee(start_date: Date, first_name: String, last_name: String, email: String, tagline: String) -> Tippee{
        let tippee = Tippee(start_date: start_date, first_name: first_name, last_name: last_name, email: email, tagline: tagline)
        self.tippees.append(tippee)
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let postData = try! encoder.encode(tippee)
        request.httpBody = postData
        print("This is the Tippee PostData sent to db: \(postData)")
        
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
        print("tippee was sent to db")
        return tippee
    }
    */
    
    
    // THIS IS TO CREATE KAI'S TIPPEE!
    func createTippee(start_date: Date, first_name: String, last_name: String, email: String, tagline: String) -> Tippee{
        let tippee = Tippee(first_name: first_name, last_name: last_name, email: email)
        self.tippees.append(tippee)
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let postData = try! encoder.encode(tippee)
        request.httpBody = postData
        print("This is the Tippee PostData sent to db: \(postData)")
        
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
        print("tippee was sent to db")
        return tippee
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
                print("number of tippees is: \(tippee.count)")
                self.tippees = tippee
                print ("TipeeController tippees is : \(self.tippees.count)")
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
    
    func updateTippee(){
        
    }
    
    func deleteTippee(){
        
    }
}
