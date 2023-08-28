//
//  HealthTypeViewModel.swift
//  HealthData
//
//  Created by Riddhi Makwana on 28/08/23.
//

import Foundation
import HealthKit

class HealthTypeViewModel: HealthStoreManagerInjectable {
    var currentFeature:SupportedFeatures?
    var recordTypesModel:[HealthTypeModel]? {
        get {
            guard let featureType = currentFeature?.id else { return nil }
            switch featureType {
            case .healthRecords:
                var returnRecordTypes = [HealthTypeModel]()
                let allergyStatus = self.healthStoreManager.isAuthorizedForClinicalRecords(forType: .allergyRecord)
                if let status = allergyStatus.1, status != .notDetermined {
                    returnRecordTypes.append(HealthTypeModel(inType: .allergyRecord, inStatus: status, inDisplayString: "Allergy"))
                }
                let conditionStatus = self.healthStoreManager.isAuthorizedForClinicalRecords(forType: .conditionRecord)
                if let status = conditionStatus.1, status != .notDetermined {
                    returnRecordTypes.append(HealthTypeModel(inType: .conditionRecord, inStatus: status, inDisplayString: "Conditions"))
                }
                let immunizationStatus = self.healthStoreManager.isAuthorizedForClinicalRecords(forType: .immunizationRecord)
                if let status = immunizationStatus.1, status != .notDetermined {
                    returnRecordTypes.append(HealthTypeModel(inType: .immunizationRecord, inStatus: status, inDisplayString: "Immunizations"))
                }
                let labresultStatus = self.healthStoreManager.isAuthorizedForClinicalRecords(forType: .labResultRecord)
                if let status = labresultStatus.1, status != .notDetermined {
                    returnRecordTypes.append(HealthTypeModel(inType: .labResultRecord, inStatus: status, inDisplayString: "Lab Results"))
                }
                let medicationStatus = self.healthStoreManager.isAuthorizedForClinicalRecords(forType: .medicationRecord)
                if let status = medicationStatus.1, status != .notDetermined {
                    returnRecordTypes.append(HealthTypeModel(inType: .medicationRecord, inStatus: status, inDisplayString: "Medications"))
                }
                let procedureStatus = self.healthStoreManager.isAuthorizedForClinicalRecords(forType: .procedureRecord)
                if let status = procedureStatus.1, status != .notDetermined {
                    returnRecordTypes.append(HealthTypeModel(inType: .procedureRecord, inStatus: status, inDisplayString: "Procedures"))
                }
                let vitalSignStatus = self.healthStoreManager.isAuthorizedForClinicalRecords(forType: .vitalSignRecord)
                if let status = vitalSignStatus.1, status != .notDetermined {
                    returnRecordTypes.append(HealthTypeModel(inType: .vitalSignRecord, inStatus: status, inDisplayString: "Clinical Vitals"))
                }
                return returnRecordTypes
            default:
                return nil
            }
        }
    }
}
