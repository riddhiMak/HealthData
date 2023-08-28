//
//  LaunchViewViewController.swift
//  HealthData
//
//  Created by Riddhi Makwana on 28/08/23.
//

import UIKit
import HealthKit

class LaunchViewViewController: UITableViewController {

    let viewModel = LaunchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.supportedFeatures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = viewModel.supportedFeatures[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showFeatureLanding", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showFeatureLanding":
            if let destinationVC = segue.destination as? HealthTypeTableViewController {
                if let indexPath = sender as? IndexPath {
                    destinationVC.currentFeatures = viewModel.supportedFeatures[indexPath.row]
                }
            }
        default:
            break
        }
    }
}
