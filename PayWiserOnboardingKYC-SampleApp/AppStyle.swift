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
        
        PayWiserOnboardingKYC.Style.Other.activityIndicatorStyle = IosCompatibility.activityIndicatorStyleCustom
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
        
        PayWiserOnboardingKYC.Style.Other.activityIndicatorStyle = IosCompatibility.activityIndicatorStyleDefault
        
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


class KycButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        switch Style.Buttons.mainStyle {
        case .Default:
            self.backgroundColor = Style.Colors.mainColor
            self.tintColor = Style.Colors.buttonTextColor
        case .Outlined:
            self.backgroundColor = Style.Colors.buttonTextColor
            self.tintColor = Style.Colors.mainColor
            self.layer.borderColor = Style.Colors.mainColor.cgColor
            self.layer.borderWidth = Style.Shapes.borderWidth
        case .Inverted:
            self.backgroundColor = Style.Colors.buttonTextColor
            self.tintColor = Style.Colors.mainColor
        }
        self.layer.cornerRadius = Style.Shapes.cornerRadius
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if Style.Buttons.mainWidth >= 250, superview != nil {
            self.leadingConstraintButton?.isActive = false
            self.trailingConstraintButton?.isActive = false
            self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
            self.widthAnchor.constraint(equalToConstant: Style.Buttons.mainWidth).isActive = true
            self.setNeedsLayout()
        }
        else {
            if superview != nil {
                self.leadingConstraintButton?.constant = Style.Layout.contentLeadingTrailingMargins
                self.trailingConstraintButton?.constant = Style.Layout.contentLeadingTrailingMargins
            }
        }
    }
}
class KycButtonInverted: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        self.tintColor = Style.Colors.mainColor
        self.setTitleColor(Style.Colors.tertiaryColor, for: .disabled)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if superview != nil {
            self.leadingConstraintButton?.constant = Style.Layout.contentLeadingTrailingMargins
        }
    }
}
class KycTitle: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        self.textColor = Style.Colors.titleTextColor
        self.font = Style.Fonts.titleText
    }
}
class KycWarningTextLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.clear
        self.textColor = Style.Colors.warningColor
        self.font = Style.Fonts.text
    }
}
class KycTextLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.clear
        self.textColor = Style.Colors.textColor
        self.font = Style.Fonts.text
    }
}
class KycText: UITextView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.clear
        self.textColor = Style.Colors.textColor
        self.font = Style.Fonts.text
    }
}
class KycHelperText: UITextView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.clear
        self.textColor = Style.Colors.tertiaryColor
    }
}
class KycView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = Style.Colors.backgroundColor
    }
}
class KycSecondaryView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = Style.Colors.secondaryBackgroundColor
        if Style.Shapes.showSeparators {
            self.layer.borderWidth = 1
            self.layer.borderColor = Style.Colors.separatorColor.cgColor
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if superview != nil {
            self.topConstraintView?.constant = Style.Layout.contentTopMargin
        }
    }
}
class KycContentView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.clear
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if superview != nil {
            self.leadingConstraintView?.constant = Style.Layout.contentLeadingTrailingMargins
            self.trailingConstraintView?.constant = Style.Layout.contentLeadingTrailingMargins
        }
    }
}


enum IosCompatibility {
    
    static var activityIndicatorStyleDefault: UIActivityIndicatorView.Style {
        if #available(iOS 13, *) {
            return .large
        } else {
            return .whiteLarge
        }
    }
    static var activityIndicatorStyleCustom: UIActivityIndicatorView.Style {
        if #available(iOS 13, *) {
            return .medium
        } else {
            return .whiteLarge
        }
    }
}



extension UIButton {
    
    var leadingConstraintButton: NSLayoutConstraint? {
        get {
            self.superview?.constraints.first(where: {
                $0.firstItem as? UIView == self && $0.firstAttribute == .leading && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    var trailingConstraintButton: NSLayoutConstraint? {
        get {
            self.superview?.constraints.first(where: {
                $0.secondItem as? UIView == self && $0.firstAttribute == .trailing && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}

extension UIView {
    
    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    var leadingConstraintView: NSLayoutConstraint? {
        get {
            self.superview?.constraints.first(where: {
                $0.firstItem as? UIView == self && $0.firstAttribute == .leading && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    var trailingConstraintView: NSLayoutConstraint? {
        get {
            self.superview?.constraints.first(where: {
                $0.secondItem as? UIView == self && $0.firstAttribute == .trailing && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    var topConstraintView: NSLayoutConstraint? {
        get {
            self.superview?.constraints.first(where: {
                $0.firstItem as? UIView == self && $0.firstAttribute == .top && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}


extension UIViewController {
    
    func showLoading(vc: UIViewController) {
        
        let activityView = UIActivityIndicatorView()
        activityView.style = Style.Other.activityIndicatorStyle
        activityView.color = UIColor.label
        activityView.center = vc.view.center
        activityView.tag = 0123
        vc.view.addSubview(activityView)
        activityView.startAnimating()
        
        vc.view.isUserInteractionEnabled = false
    }
    
    func hideLoading(vc: UIViewController) {
        if let activityView = vc.view.viewWithTag(0123) {
            activityView.removeFromSuperview()
        }
        vc.view.isUserInteractionEnabled = true
    }
    
    func transitionFromRightToLeft() {

        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.navigationController?.view.layer.add(transition, forKey: nil)
    }
}
