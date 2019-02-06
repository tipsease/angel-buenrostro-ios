//
//  TipViewController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/4/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    let tipperController = TipperController()

    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var confirmTipButton: UIButton!
    @IBAction func confirmTipButtonTapped(_ sender: UIButton) {
        print("confirm button tapped")
    }
    @IBOutlet weak var totalBillTextField: UITextField!
    @IBAction func fivePercentTapped(_ sender: UIButton) {
        if totalBillTextField.text != nil {
            tipTextField.text = String(calculateTip(totalBill: totalBillTextField.text!, percentage: 0.05))
        }
    }
    @IBAction func tenPercentTapped(_ sender: Any) {
    }
    @IBAction func fifteenPercentTapped(_ sender: Any) {
    }
    @IBAction func twentyPercentTapped(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tipperController.createTipperAuthentication(email: "kl.hawaii3e243@gmail.com", password: "test", tipperBoolean: true)
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
    
    func calculateTip(totalBill: String, percentage: Double) -> Double {
        let bill = Double(totalBill)
        return (bill!*percentage)
    }
}
