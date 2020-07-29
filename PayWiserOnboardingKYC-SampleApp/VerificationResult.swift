//
//  VerificationResult.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 6/26/20.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit
import PayWiserOnboardingKYC


struct KycResult {
    
    static var AppReferenceID : String?
    static var KycReferenceID : String?
    static var KycID : String?
    static var StatusCode : Int?
    static var StatusDescription : String?
}


public class VerificationResult : VerificationResultProtocol {
    
    init() {}
    
    
    public func success(event : SuccessEvent) -> Void {
        
        KycResult.AppReferenceID = event.getAppReferenceID()
        KycResult.KycReferenceID = event.getKycReferenceID()
        
        let kycId = event.getKycID()
        KycResult.KycID = kycId
        UserDefaults.standard.set(kycId, forKey: "kycId")
        
        goToResultScreen(success: true)
    }
    
    public func error(event: ErrorEvent) {
        
        KycResult.AppReferenceID = event.getAppReferenceID()
        KycResult.KycReferenceID = event.getKycReferenceID()
        KycResult.StatusCode = event.getStatusCode()
        KycResult.StatusDescription = event.getStatusDescription()
        
        goToResultScreen(success: false)
        
    }
    
    
    func goToResultScreen(success: Bool) {
        
        var vc = String()
        if success {
            vc = "KycDataViewController"
        }
        else {
            vc = "KycErrorViewController"
        }
        
        let initStoryboard = UIStoryboard(name: vc, bundle: nil)
        let initVC = initStoryboard.instantiateViewController(withIdentifier: vc)
        
        let parent = UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController
        let current = parent?.children[0]

        current?.willMove(toParent: nil)
        current?.view.removeFromSuperview()
        current?.removeFromParent()
        parent?.addChild(initVC)
        parent?.view.addSubview(initVC.view)
        initVC.didMove(toParent: parent)
        
//        let parent = presentingVC.parent
//        presentingVC.willMove(toParent: nil)
//        presentingVC.view.removeFromSuperview()
//        presentingVC.removeFromParent()
//        parent?.addChild(initVC)
//        parent?.view.addSubview(initVC.view)
//        initVC.didMove(toParent: parent)
        
        
    }
    
    
}

