//
//  KycData.swift
//  PayWiserOnboardingKYC-SampleApp
//
//  Created by tjasa on 20/07/2020.
//  Copyright © 2020 Intech. All rights reserved.
//

import UIKit


struct KycData : Decodable {
    
    var Process: KycProcess
    var Document: KycDocument?
    var PersonalData: KycPersonalData
    
    enum CodingKeys: String, CodingKey {
        case Process, Document, PersonalData
    }
}


struct KycProcess : Decodable {
    
    var AttendedMode : Bool
    var UseVerification : Bool
    var VerificationStatus: String
    
    enum CodingKeys: String, CodingKey {
        case AttendedMode, UseVerification, VerificationStatus
    }
}

struct KycDocument : Decodable {
    
    var Classification : String?
    var DocType: String?
    var Issuer: String?
    var ExpiryDate: String?
    var PassportNumber: String?
    var DocumentNumber: String?
    var Subject: KycSubject?
    
    enum CodingKeys: String, CodingKey {
        case Classification, DocType = "Type", Issuer, ExpiryDate, PassportNumber, DocumentNumber, Subject
    }
}

struct KycSubject : Decodable {
    
    var PrimaryName: String?
    var SecondaryName: String?
    var BirthDate: String?
    var Gender: String?
    var Nationality: String?
    var PersonalNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case PrimaryName, SecondaryName, BirthDate, Gender, Nationality, PersonalNumber
    }
}

struct KycPersonalData : Decodable {

    var MobileNumber : String
    var Email : String
    var FirstName : String?
    var MiddleName: String?
    var LastName : String?
    var Address1 : String?
    var Address2 : String?
    var Address3 : String?
    var ZipCode : String?
    var City : String?
    var State : String?
    var CountryCode : String?
    var CountryName : String?

    enum CodingKeys: String, CodingKey {
        case MobileNumber, Email, FirstName, MiddleName, LastName, Address1, Address2, Address3, ZipCode, City, State, CountryCode, CountryName
    }
}

