//
//  ViewController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/4/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let tipperController = TipperController()
    let tippeeController = TippeeController()
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    @IBOutlet weak var createAccountButton: UIButton!
    @IBAction func createAccountButtonTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tippeeController.allTippees { (error) in
            print("Tippees are: \(self.tippeeController.tippees.count)")
        }
        setUp()
//        tipperController.createTipper(first_name: "Angel", last_name: "Buenrostro", email: "idk@gmail.com")
        let currentDate = Date()
//        tippeeController.createTippee(start_date: currentDate, first_name: "Angel", last_name: "Buenrostro", email: "idk@gmail.com", tagline: "Yoo this is a test")
        tipperController.allTippers { (error) in
            print("\(self.tipperController.tippers.count)")
        }
        tipperController.searchTipper(id: 1) { (error) in
            print("Tipper Controller data is: \(self.tipperController.tippers)")
            print("Id 1 Name is : \(self.tipperController.tippers[0].first_name)")
            
            
        
        }
        tippeeController.searchTippee(id: 1) { (error) in
            print("Tippee Controller data is: \(self.tippeeController.tippees[0])")
            print("Id 1 Tippee is: \(self.tippeeController.tippees[0].first_name)")
        
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userNameTextField.becomeFirstResponder()
    }
}

extension LoginViewController {
    func setUp(){
        userNameTextField.layer.cornerRadius = 20
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setRadiusWithShadow(CGFloat(20), color: UIColor.darkGray.cgColor)
        createAccountButton.setRadiusWithShadow(CGFloat(20), color: UIColor.darkGray.cgColor)
        backgroundView.setRadiusWithShadow(CGFloat(20), color: UIColor.lightGray.cgColor)
    }
}

extension UIView {
    func setRadiusWithShadow(_ radius: CGFloat? = nil, color: CGColor) { // this method adds shadow to right and bottom side of button
        self.layer.cornerRadius = (radius ?? self.frame.width / 2)
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 1.75
        self.layer.shadowOpacity = 0.6
        self.layer.masksToBounds = false
}
}
