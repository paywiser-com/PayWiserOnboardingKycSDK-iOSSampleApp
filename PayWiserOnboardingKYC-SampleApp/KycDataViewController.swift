//
//  KycDataViewController.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 20/07/2020.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit


class KycDataViewController : UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var KycTitle: UILabel!
    @IBOutlet weak var DataNotAvailable: UILabel!
    @IBOutlet weak var CloseButton: UIButton!
    
    
    @IBOutlet weak var VideoStatus: UILabel!
    @IBOutlet weak var VideoStatusDetails: UILabel!
    @IBOutlet weak var VerificationStatus: UILabel!
    @IBOutlet weak var CheckStatus: UILabel!
    
    @IBOutlet weak var FirstName: UILabel!
    @IBOutlet weak var MiddleName: UILabel!
    @IBOutlet weak var LastName: UILabel!
    
    @IBOutlet weak var MobileNumber: UILabel!
    @IBOutlet weak var Email: UILabel!
    
    @IBOutlet weak var Address1: UILabel!
    @IBOutlet weak var Address2: UILabel!
    @IBOutlet weak var ZipCode: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Country: UILabel!
    
    @IBOutlet weak var Classification: UILabel!
    @IBOutlet weak var DocType: UILabel!
    @IBOutlet weak var Issuer: UILabel!
    @IBOutlet weak var ExpiryDate: UILabel!
    @IBOutlet weak var DocumentNumber: UILabel!
    @IBOutlet weak var PrimaryName: UILabel!
    @IBOutlet weak var SecondaryName: UILabel!
    @IBOutlet weak var BirthDate: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Nationality: UILabel!
    @IBOutlet weak var PersonalNumber: UILabel!
    
    @IBOutlet weak var DocumentInfoView: UIStackView!
    @IBOutlet weak var DocumentInfoNotAvailable: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isHidden = true
        DataNotAvailable.isHidden = true
        DocumentInfoNotAvailable.isHidden = true
        CloseButton.isHidden = true
        
        showLoading(vc: self)
        
        KycResult.KycID = UserDefaults.standard.string(forKey: "kycId")
        
        apiGetKycData(ReferenceID: UUID().uuidString, KYCID: KycResult.KycID!, completionHandler: { kycData, error in

            if let data = kycData {
                self.setKycValues(data: data)
                
                if showData == true {
                    self.KycTitle.text = NSLocalizedString("KYC Data", comment: "")
                    showData = false
                    self.CloseButton.isHidden = true
                }
                else {
                    self.KycTitle.text = NSLocalizedString("KYC Successful", comment: "")
                    self.KycTitle.textColor = .systemGreen
                    self.CloseButton.isHidden = false
                }
                if data.Document == nil {
                    self.DocumentInfoView.isHidden = true
                    self.DocumentInfoNotAvailable.isHidden = false
                }
                self.scrollView.isHidden = false
            }
            else {
                self.DataNotAvailable.isHidden = false
            }
            self.hideLoading(vc: self)
        })

    }
    
    func setKycValues(data: KycData) {
        
        VideoStatus.text = NSLocalizedString("Video status: ", comment: "") + data.Process.VideoStatus
        VideoStatusDetails.text = NSLocalizedString("Video status details: ", comment: "") + (data.Process.VideoStatusDetails ?? "")
        VerificationStatus.text = NSLocalizedString("Human verification status: ", comment: "") + data.Process.VerificationStatus
        CheckStatus.text = NSLocalizedString("Check status: ", comment: "") + data.Process.CheckStatus
        
        FirstName.text = NSLocalizedString("First name: ", comment: "") + (data.PersonalData.FirstName ?? "")
        MiddleName.text = NSLocalizedString("Middle name: ", comment: "") + (data.PersonalData.MiddleName ?? "")
        LastName.text = NSLocalizedString("Last name: ", comment: "") + (data.PersonalData.LastName ?? "")
        MobileNumber.text = NSLocalizedString("Phone number: ", comment: "") + data.PersonalData.MobileNumber
        Email.text = NSLocalizedString("Email: ", comment: "") + data.PersonalData.Email
        Address1.text = NSLocalizedString("Address 1: ", comment: "") + (data.PersonalData.Address1 ?? "")
        Address2.text = NSLocalizedString("Address 2: ", comment: "") + (data.PersonalData.Address2 ?? "")
        ZipCode.text = NSLocalizedString("Zip code: ", comment: "") + (data.PersonalData.ZipCode ?? "")
        City.text = NSLocalizedString("City: ", comment: "") + (data.PersonalData.City ?? "")
        Country.text = NSLocalizedString("Country: ", comment: "") + (data.PersonalData.CountryName ?? "")
        
        Classification.text = NSLocalizedString("Classification: ", comment: "") + (data.Document?.Classification ?? "")
        DocType.text = NSLocalizedString("Type: ", comment: "") + (data.Document?.DocType ?? "")
        Issuer.text = NSLocalizedString("Issuer: ", comment: "") + (data.Document?.Issuer ?? "")
        ExpiryDate.text = NSLocalizedString("Expiry date: ", comment: "") + (data.Document?.ExpiryDate ?? "")
        if data.Document?.PassportNumber != nil {
            DocumentNumber.text = NSLocalizedString("Passport number: ", comment: "") + (data.Document?.PassportNumber ?? "")
        }
        else {
            DocumentNumber.text = NSLocalizedString("Document number: ", comment: "") + (data.Document?.DocumentNumber ?? "")
        }
        PrimaryName.text = NSLocalizedString("Primary name: ", comment: "") + (data.Document?.Subject?.PrimaryName ?? "")
        SecondaryName.text = NSLocalizedString("Secondary name: ", comment: "") + (data.Document?.Subject?.SecondaryName ?? "")
        BirthDate.text = NSLocalizedString("Birth date: ", comment: "") + (data.Document?.Subject?.BirthDate ?? "")
        Gender.text = NSLocalizedString("Gender: ", comment: "") + (data.Document?.Subject?.Gender ?? "")
        Nationality.text = NSLocalizedString("Nationality: ", comment: "") + (data.Document?.Subject?.Nationality ?? "")
        PersonalNumber.text = NSLocalizedString("Personal number: ", comment: "") + (data.Document?.Subject?.PersonalNumber ?? "")
        
    }
    
    
    @IBAction func onClose(_ sender: Any) {
        showLoading(vc: self)
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    
    
}
