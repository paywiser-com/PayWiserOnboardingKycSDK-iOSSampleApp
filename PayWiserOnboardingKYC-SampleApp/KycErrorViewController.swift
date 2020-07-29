//
//  KycErrorViewController.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 20/07/2020.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit


class KycErrorViewController : UIViewController {
    
    
    @IBOutlet weak var ErrorDescription: UITextView!
    @IBOutlet weak var RestartKycButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ErrorDescription.text = KycResult.StatusDescription
    }
    
    @IBAction func onRestartKyc(_ sender: Any) {
        showLoading(vc: self)
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    
}
