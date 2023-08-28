//
//  LaunchViewModel.swift
//  HealthData
//
//  Created by Riddhi Makwana on 28/08/23.
//

import Foundation

class LaunchViewModel {
    let supportedFeatures:[SupportedFeatures]
    init() {
        supportedFeatures = [SupportedFeatures(id:SupportedFeaturesId.healthRecords, title:"Health Records")]
    }
    
    func convertJsonStringToDictionary(inData: Data?) -> [String: Any]? {
        if let data = inData {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
