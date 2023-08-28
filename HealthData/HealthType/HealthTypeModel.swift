//
//  HealthTypeModel.swift
//  HealthData
//
//  Created by Riddhi Makwana on 28/08/23.
//

import Foundation
import HealthKit

struct HealthTypeModel {
    let type:HKClinicalTypeIdentifier
    let authorizationStatus:HKAuthorizationStatus
    let displayString:String
    
    init(inType: HKClinicalTypeIdentifier, inStatus: HKAuthorizationStatus, inDisplayString: String) {
        self.type = inType
        self.authorizationStatus = inStatus
        self.displayString = inDisplayString
    }
}
