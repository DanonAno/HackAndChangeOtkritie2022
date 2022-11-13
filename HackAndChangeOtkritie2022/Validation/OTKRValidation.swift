//
//  OTKRValidation.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import Foundation

class OTKRValidation {
    static func validate(value: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
               let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
               return phoneTest.evaluate(with: value)
    }
}
