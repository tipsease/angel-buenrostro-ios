//
//  TipViewController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/4/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    var tipperController: TipperController = TipperController()
    var tippeeController: TippeeController = TippeeController()
    var token: Token?
    var tipper: Tipper?
    var tippee: Tippee?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var confirmTipButton: UIButton!
    @IBAction func confirmTipButtonTapped(_ sender: UIButton) {
        print("confirm button tapped")
        guard let tipAmount = tipTextField.text else { return }
        
        if tipAmount == "" {
            let alert = UIAlertController(title: "Oops!", message: "Please select a tip percentage", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        if Double(tipAmount) == Double(0){
            let alert = UIAlertController(title: "Oops!", message: "Tip amount cannot be zero", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        else {
            guard let tippeeName = self.navigationItem.title else { return }
            let alert = UIAlertController(title: "Confirm Tip?", message: "Do you wish to send $\(tipAmount) to \(tippeeName)?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
                let date = Date()
                let madeTip = self.tippeeController.createTip(tippee_id: (self.tippee?.id)!, tipper_id: (self.tipper!.id)!, amount: Double(tipAmount)!, date: date)
                print("THE CRUCIAL TIPPER ID IS: \(self.tipper!.id)")
                print("Sent this amount: \(madeTip)")
            }))
            self.present(alert, animated: true)
            return
        }
//        guard let tipperNotNil = self.tipper else {
//            tippeeController?.createTip(tipper_id: tipperController.tippers[0].id!, amount: Double(amount)!, date: date)
//            print("Tipper is nil")
//            return}
//        print("THE CRUCIAL TIPPER ID IS: \(self.tipper!.id)")
//        let madeTip = tippeeController.createTip(tippee_id: (tippee?.id)!, tipper_id: (tipper!.id)!, amount: Double(tipAmount)!, date: date)
//
//        print("Sent this amount: \(madeTip)")
        //TODO: Send Tip Request
        
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.tipper?.first_name)
        print(self.tippee?.first_name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        print("Tipper is: \(self.tipper)")
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
        self.navigationItem.title = (tippee?.first_name)! + " " + (tippee?.last_name)!
        let url = URL(string: (tippee?.photo_url)!)
        imageView.load(url: url!)
    }
    
    func calculateTip(totalBill: String, percentage: Double) -> Double {
        if totalBill == "" {
            return 0.0
        }
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

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.image = image
                    }
                }
            }
        }
    }
}
