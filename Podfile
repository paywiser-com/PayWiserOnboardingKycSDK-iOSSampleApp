# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'PayWiserOnboardingKYC-SampleApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PayWiserOnboardingKYC-SampleApp

  pod 'PayWiserOnboardingKYC', '3.6.0'
  pod 'IdensicMobileSDK', :http => 'https://github.com/paywiser-com/PayWiserOnboardingKycSDK-iOS-IdensicMobile/archive/v1.0.0.tar.gz'
  pod 'InAppSettingsKit', '3.3'


  post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
	    config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
    end
  end

end
