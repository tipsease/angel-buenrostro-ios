//
//  TipViewController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/4/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    var tipperController: TipperController?
    var tippeeController: TippeeController?
    var token: Token?
    var tipper: Tipper?
    var tippee: Tippee?

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
        if totalBillTextField.text != nil {
            tipTextField.text = String(calculateTip(totalBill: totalBillTextField.text!, percentage: 0.10))
        }
    }
    @IBAction func fifteenPercentTapped(_ sender: Any) {
        if totalBillTextField.text != nil {
            tipTextField.text = String(calculateTip(totalBill: totalBillTextField.text!, percentage: 0.15))
        }
    }
    @IBAction func twentyPercentTapped(_ sender: Any) {
        if totalBillTextField.text != nil {
            tipTextField.text = String(calculateTip(totalBill: totalBillTextField.text!, percentage: 0.20))
        }
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
    
    func calculateTip(totalBill: String, percentage: Double) -> Double {
        let bill = Double(totalBill)
        return (bill!*percentage).rounded(digits: 2)
    }
}

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
