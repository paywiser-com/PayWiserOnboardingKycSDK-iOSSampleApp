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
        
        PayWiserOnboardingKYC.Style.Colors.backgroundColor = .white
        PayWiserOnboardingKYC.Style.Colors.secondaryBackgroundColor = .white
        PayWiserOnboardingKYC.Style.Colors.tertiaryBackgroundColor = .white
        PayWiserOnboardingKYC.Style.Colors.backgroundStyle = .CustomLight
        
        PayWiserOnboardingKYC.Style.Colors.mainColor = UIColor.systemBlue.withAlphaComponent(0.8)
        PayWiserOnboardingKYC.Style.Colors.secondaryColor = .systemIndigo
        PayWiserOnboardingKYC.Style.Colors.tertiaryColor = .lightGray
        
        PayWiserOnboardingKYC.Style.Colors.titleTextColor = UIColor.systemBlue.withAlphaComponent(0.8)
        PayWiserOnboardingKYC.Style.Colors.textColor = .darkGray
        
        PayWiserOnboardingKYC.Style.Fonts.titleText = UIFont.systemFont(ofSize: 20, weight: .medium)
        PayWiserOnboardingKYC.Style.Fonts.text = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        PayWiserOnboardingKYC.Style.Shapes.showSeparators = false
        PayWiserOnboardingKYC.Style.Shapes.inputField = .Line
        PayWiserOnboardingKYC.Style.Shapes.borderWidth = 1
        PayWiserOnboardingKYC.Style.Shapes.cornerRadius = 15
        
        PayWiserOnboardingKYC.Style.Buttons.mainWidth = 250
        PayWiserOnboardingKYC.Style.Buttons.mainStyle = .Outlined
        PayWiserOnboardingKYC.Style.Buttons.documentTypeWidth = 250
        PayWiserOnboardingKYC.Style.Buttons.documentTypeStyle = .Outlined
        
        PayWiserOnboardingKYC.Style.Texts.navbarTitle = "Sample App"
        
        PayWiserOnboardingKYC.Style.Layout.contentTopMargin = 10
        PayWiserOnboardingKYC.Style.Layout.contentLeadingTrailingMargins = 20
    }
    
    static func setDefaultStyle() {
        
        PayWiserOnboardingKYC.Style.Colors.backgroundColor = .systemGroupedBackground
        PayWiserOnboardingKYC.Style.Colors.secondaryBackgroundColor = .secondarySystemGroupedBackground
        PayWiserOnboardingKYC.Style.Colors.tertiaryBackgroundColor = .tertiarySystemBackground
        PayWiserOnboardingKYC.Style.Colors.backgroundStyle = .Default
        
        PayWiserOnboardingKYC.Style.Colors.mainColor = getDefaultMainColor()
        PayWiserOnboardingKYC.Style.Colors.secondaryColor = .systemBlue
        PayWiserOnboardingKYC.Style.Colors.tertiaryColor = .placeholderText
        PayWiserOnboardingKYC.Style.Colors.borderColor = .lightGray
        PayWiserOnboardingKYC.Style.Colors.warningColor = .systemRed
        
        PayWiserOnboardingKYC.Style.Colors.titleTextColor = .label
        PayWiserOnboardingKYC.Style.Colors.textColor = .secondaryLabel
        PayWiserOnboardingKYC.Style.Colors.buttonTextColor = .white
        PayWiserOnboardingKYC.Style.Colors.separatorColor = .separator
        
        PayWiserOnboardingKYC.Style.Fonts.titleText = UIFont.systemFont(ofSize: 17, weight: .regular)
        PayWiserOnboardingKYC.Style.Fonts.text = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        PayWiserOnboardingKYC.Style.Shapes.showSeparators = true
        PayWiserOnboardingKYC.Style.Shapes.inputField = .Rectangle
        PayWiserOnboardingKYC.Style.Shapes.borderWidth = 0.5
        PayWiserOnboardingKYC.Style.Shapes.cornerRadius = 5
        
        PayWiserOnboardingKYC.Style.Buttons.mainWidth = 0
        PayWiserOnboardingKYC.Style.Buttons.mainStyle = .Default
        PayWiserOnboardingKYC.Style.Buttons.documentTypeWidth = 0
        PayWiserOnboardingKYC.Style.Buttons.documentTypeStyle = .Default
        
        PayWiserOnboardingKYC.Style.Texts.navbarTitle = "PaywiserOnboardingKYC"
        
        PayWiserOnboardingKYC.Style.Layout.contentTopMargin = 30
        PayWiserOnboardingKYC.Style.Layout.contentLeadingTrailingMargins = 40
        
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
