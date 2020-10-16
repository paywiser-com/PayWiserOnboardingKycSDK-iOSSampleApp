//
//  KycDataViewController.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 20/07/2020.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit
import PayWiserOnboardingKYC


class KycDataViewController : UIViewController {
    
    
    @IBOutlet weak var KycTitle: UILabel!
    @IBOutlet weak var CloseButton: UIButton!
    
    @IBOutlet weak var AppReferenceID: KycTextLabel!
    @IBOutlet weak var ReferenceNumber: KycTextLabel!
    @IBOutlet weak var KycReferenceID: KycTextLabel!
    @IBOutlet weak var KycID: KycTextLabel!
    @IBOutlet weak var PersonID: KycTextLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CloseButton.isHidden = false
        
        KycTitle.text = "KYC Successful"
        KycTitle.textColor = .systemGreen
        
        setKycValues()

    }
    
    func setKycValues() {
        
        AppReferenceID.text = "AppReferenceID: " + (KycResult.AppReferenceID ?? "")
        ReferenceNumber.text = "ReferenceNumber: " + (KycResult.ReferenceNumber ?? "")
        KycReferenceID.text = "KycReferenceID: " + (KycResult.KycReferenceID ?? "")
        KycID.text = "KycID: " + (KycResult.KycID ?? "")
        PersonID.text = "PersonID: " + (KycResult.PersonID ?? "")
    }
    
    
    @IBAction func onClose(_ sender: Any) {
        showLoading(vc: self)
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    
    
}
