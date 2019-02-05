//
//  TipViewController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/4/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var confirmTipButton: UIButton!
    @IBAction func confirmTipButtonTapped(_ sender: UIButton) {
        print("confirm button tapped")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TipViewController {
    func setUp(){
        confirmTipButton.setRadiusWithShadow(CGFloat(20), color: UIColor.darkGray.cgColor)
    }
}
