//
//  AppStyle.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 29/07/2020.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit
import PayWiserOnboardingKYC


class AppStyle {
    
    static func setCustomStyle() {
        
        PayWiserOnboardingKYC.Style.Colors.statusBarColor = .systemBlue
        PayWiserOnboardingKYC.Style.Colors.navbarColor = .systemBlue
        
        PayWiserOnboardingKYC.Style.Colors.backgroundColor = .white
        PayWiserOnboardingKYC.Style.Colors.secondaryBackgroundColor = .white
        PayWiserOnboardingKYC.Style.Colors.tertiaryBackgroundColor = .white
        PayWiserOnboardingKYC.Style.Colors.backgroundStyle = .CustomLight
        
        PayWiserOnboardingKYC.Style.Colors.mainColor = UIColor.systemBlue.withAlphaComponent(0.8)
        PayWiserOnboardingKYC.Style.Colors.secondaryColor = .systemIndigo
        PayWiserOnboardingKYC.Style.Colors.tertiaryColor = .lightGray
        
        PayWiserOnboardingKYC.Style.Colors.navbarTextColor = .white
        PayWiserOnboardingKYC.Style.Colors.navbarButtonColor = .white
        PayWiserOnboardingKYC.Style.Colors.titleTextColor = UIColor.systemBlue.withAlphaComponent(0.8)
        PayWiserOnboardingKYC.Style.Colors.textColor = .darkGray
        
        PayWiserOnboardingKYC.Style.Texts.navbarTitle = "KYC Sample App"
        
        PayWiserOnboardingKYC.Style.Fonts.navbarTitle = UIFont.systemFont(ofSize: 17, weight: .semibold)
        PayWiserOnboardingKYC.Style.Fonts.titleText = UIFont.systemFont(ofSize: 20, weight: .medium)
        PayWiserOnboardingKYC.Style.Fonts.text = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        PayWiserOnboardingKYC.Style.Shapes.inputField = .Line
        PayWiserOnboardingKYC.Style.Shapes.showSeparators = false
        
    }
    
    static func setDefaultStyle() {
        
        PayWiserOnboardingKYC.Style.Colors.statusBarColor = .systemBackground
        PayWiserOnboardingKYC.Style.Colors.navbarColor = .systemBackground
        
        PayWiserOnboardingKYC.Style.Colors.backgroundColor = .systemGroupedBackground
        PayWiserOnboardingKYC.Style.Colors.secondaryBackgroundColor = .secondarySystemGroupedBackground
        PayWiserOnboardingKYC.Style.Colors.tertiaryBackgroundColor = .tertiarySystemBackground
        PayWiserOnboardingKYC.Style.Colors.backgroundStyle = .Default
        
        PayWiserOnboardingKYC.Style.Colors.mainColor = getDefaultMainColor()
        PayWiserOnboardingKYC.Style.Colors.secondaryColor = .systemBlue
        PayWiserOnboardingKYC.Style.Colors.tertiaryColor = .placeholderText
        PayWiserOnboardingKYC.Style.Colors.borderColor = .lightGray
        PayWiserOnboardingKYC.Style.Colors.warningColor = .systemRed
        
        PayWiserOnboardingKYC.Style.Colors.navbarTextColor = .label
        PayWiserOnboardingKYC.Style.Colors.navbarButtonColor = .systemBlue
        PayWiserOnboardingKYC.Style.Colors.titleTextColor = .label
        PayWiserOnboardingKYC.Style.Colors.textColor = .secondaryLabel
        PayWiserOnboardingKYC.Style.Colors.buttonTextColor = .white
        PayWiserOnboardingKYC.Style.Colors.separatorColor = .separator
        
        PayWiserOnboardingKYC.Style.Texts.navbarTitle = "PaywiserOnboardingKYC"
        
        PayWiserOnboardingKYC.Style.Fonts.navbarTitle = UIFont.systemFont(ofSize: 17, weight: .medium)
        PayWiserOnboardingKYC.Style.Fonts.titleText = UIFont.systemFont(ofSize: 17, weight: .regular)
        PayWiserOnboardingKYC.Style.Fonts.text = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        PayWiserOnboardingKYC.Style.Shapes.inputField = .Rectangle
        PayWiserOnboardingKYC.Style.Shapes.navbarHeight = 44
        PayWiserOnboardingKYC.Style.Shapes.cornerRadius = 5
        PayWiserOnboardingKYC.Style.Shapes.showSeparators = true
        
    }
    
    private static func getDefaultMainColor() -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    return .systemIndigo
                } else {
                    return .systemTeal
                }
            }
        } else {
            return .blue
        }
    }

}
