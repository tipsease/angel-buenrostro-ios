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
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
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
    }
}
