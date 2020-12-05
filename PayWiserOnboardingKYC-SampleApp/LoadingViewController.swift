//
//  LoadingViewController.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 08/07/2020.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit


class LoadingViewController : UIViewController {
    
    
    var activityView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sample App"
        navigationItem.setHidesBackButton(true, animated: false)
        
        activityView = UIActivityIndicatorView()
        if #available(iOS 13, *) {
            activityView.style = .large
        } else {
            activityView.style = .whiteLarge
        }
        activityView.color = .black
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    

    
}
