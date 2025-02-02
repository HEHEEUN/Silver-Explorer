//
//  PaymentSelectViewController.swift
//  Silver Explorer
//
//  Created by Jinyoung Yoo on 2023/07/31.
//

import UIKit

class PaymentSelectViewController: UIViewController, SelectedPaymentTypeDelegate {

    @IBOutlet weak var totalPriceTextField: UITextField!
    @IBOutlet weak var creditCardImageView: UIImageView!
    @IBOutlet weak var barcodeImageView: UIImageView!
    
    let resource: PaymentSelectResource = PaymentSelectResource()
    weak var kioskMainBoardDelegate: KioskMainBoardDelegate?

    var totalPrice: Int {
        guard let price = kioskMainBoardDelegate?.totalPriceForPayment() else {
            self.dismiss(animated: false)
            return 0
        }
        
        return price
    }
    var creditCardImages: [UIImage] {
        return resource.paymentImages[.creditCard]!
    }
    var barcodeImages: [UIImage] {
        return resource.paymentImages[.barcode]!
    }
    var paymentMethod: PaymentType = .creditCard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSettingForTextField()
    }

    func appear(sender: UIViewController) {
        self.modalPresentationStyle = .overFullScreen
        sender.present(self, animated: false)
    }
    
    @IBAction func creditCardSelected(_ sender: UIButton) {
        creditCardImageView.image = creditCardImages[0]
        barcodeImageView.image = barcodeImages[1]
        
        paymentMethod = .creditCard
    }
    
    @IBAction func barcodeSelected(_ sender: UIButton) {
        barcodeImageView.image = barcodeImages[0]
        creditCardImageView.image = creditCardImages[1]
        
        paymentMethod = .barcode
    }
    
    @IBAction func previousBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    @IBAction func paymentBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: PaymentViewController.self)) as! PaymentViewController
        
        vc.paymentTypeDelegate = self
        vc.appear(sender: self)
    }
    
    func initialSettingForTextField() {
        totalPriceTextField.borderStyle = .none
        totalPriceTextField.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        totalPriceTextField.layer.borderWidth = 1.0
        totalPriceTextField.layer.cornerRadius = 10.0
        totalPriceTextField.backgroundColor = .clear
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedPrice = numberFormatter.string(from: NSNumber(value: totalPrice))
        totalPriceTextField.text = "₩ \(formattedPrice!)"
    }
    
    func paymentType() -> PaymentType {
        return paymentMethod
    }
    
}
