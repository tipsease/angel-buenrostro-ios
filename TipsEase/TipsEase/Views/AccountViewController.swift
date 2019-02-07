//
//  AccountViewController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/7/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    var tipperController: TipperController?
    var tipper: Tipper?
    var tips: [Tip]?
    var tipperKai: TipperKai?
    var editBool: Bool = false
    
    @IBOutlet weak var textFieldStack: UIStackView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var editButtonOutlet: UIButton!
    @IBAction func editProfileButtonTapped(_ sender: UIButton) {
        editBool = !editBool
        if editBool {
            textFieldStack.alpha = 1.0
            editButtonOutlet.setTitle("Save Changes", for: .normal)
        } else {
            editButtonOutlet.setTitle("Edit Profile", for: .normal)
            editBool = !editBool
            DispatchQueue.main.async {
                self.tipperKai = self.tipperController?.updateTipper(id: self.tipper!.id!, first_name: self.firstNameTextField.text, last_name: self.lastNameTextField.text, email: self.emailTextField.text)
                self.updateView()
                let alert = UIAlertController(title: "Saved Changes", message: "You profile was updated.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            textFieldStack.alpha = 0.0
        }
    }
    
    override func viewDidLoad() {
        textFieldStack.alpha = 0.0
        super.viewDidLoad()
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setUp(){
        let url = URL(string: (self.tipper?.photo_url)!)
        self.navigationItem.title = (self.tipper?.first_name)! + " " + (self.tipper?.last_name)!
        imageView.load(url: url!)
        nameLabel.text = (self.tipper?.first_name)! + " " + (self.tipper?.last_name)!
        emailLabel.text = self.tipper?.email
        firstNameTextField.placeholder = (self.tipper?.first_name)!
        lastNameTextField.placeholder = (self.tipper?.last_name)!
        emailTextField.placeholder = (self.tipper?.email)!
        
        editButtonOutlet.setRadiusWithShadow(CGFloat(20), color: UIColor.darkGray.cgColor)
    }
    
    func updateView(){
        self.navigationItem.title = (self.tipperKai?.first_name)! + " " + (self.tipperKai?.last_name)!
        nameLabel.text = (self.tipperKai?.first_name)! + " " + (self.tipperKai?.last_name)!
        emailLabel.text = self.tipperKai?.email
    }
}
