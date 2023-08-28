//
//  LaunchModel.swift
//  HealthData
//
//  Created by Riddhi Makwana on 28/08/23.
//

import Foundation
struct SupportedFeatures {
    let id:SupportedFeaturesId
    var title:String?
}

enum SupportedFeaturesId {
    case healthRecords
    case healthKit
    case researchKit
    case careKit
}
