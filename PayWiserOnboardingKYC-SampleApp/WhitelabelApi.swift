//
//  WhitelabelApi.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 20/07/2020.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


let session = Alamofire.Session()


func whitelabelApi(requestUrl: String, params: JSON, completionHandler: @escaping (JSON?, NSError?) -> ()) {
    
    let username = UserDefaults.standard.string(forKey: "whitelabel_api_username") ?? ""
    let password = UserDefaults.standard.string(forKey: "whitelabel_api_password") ?? ""
    let baseUrl = UserDefaults.standard.string(forKey: "whitelabel_api_url") ?? ""
    
    let apiKey = (username + ":" + password).toBase64()
    
    let headers: HTTPHeaders = [
        "Authorization": "Basic " + apiKey,
        "Accept": "application/json"
    ]
    
    session.request(baseUrl + requestUrl, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: headers)
        .validate(statusCode: 200..<201)
        .validate(contentType: ["application/json"])
        .responseJSON(completionHandler: { response in
            //debugPrint(response)
            
            switch response.result {
                
                case .success(let value):
                    let jsonData = JSON(value)
                    if let statusCode = jsonData["StatusCode"].int {
                        if statusCode == 0 {
                            completionHandler(jsonData, nil)
                        }
                        else {
                            completionHandler(nil, NSError(domain: jsonData["StatusDescription"].string ?? "", code: -90001, userInfo: nil))
                        }
                    }
                    else {
                        completionHandler(nil, NSError(domain: "Data error whitelabel", code: -90002, userInfo: nil))
                    }
                
                case .failure(let error):
                    completionHandler(nil, NSError(domain: error.localizedDescription, code: response.response?.statusCode ?? -90003, userInfo: nil))
                }
        })
}


func apiGetKycData(ReferenceID: String, KYCID: String, completionHandler: @escaping (KycData?, NSError?) -> ()) {
    
    let params = [
        "ReferenceID" : ReferenceID,
        "KYCID" : KYCID
        ]
    
    whitelabelApi(requestUrl: "/GetKYCData", params: JSON(params), completionHandler: { jsonData, error in

        if let data = jsonData, let jsonString = data.rawString() {
            
            let decoder = JSONDecoder()
            do {
                let kycData = try decoder.decode(KycData.self, from: Data(jsonString.utf8))
                completionHandler(kycData, nil)
            }
            catch {
                completionHandler(nil, NSError(domain: "Parsing error", code: -90004, userInfo: nil))
            }
        }
        else {
            completionHandler(nil, error)
        }
    })
}
