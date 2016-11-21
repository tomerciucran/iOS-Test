//
//  ViewController.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var orderByButton: UIBarButtonItem!
    
    private let segueIdentifier = "OrderBySegue"
    var dataArray = [Trip]() {
        didSet {
            tableView.reloadData()
        }
    }
    var orderType: OrderType = .Departure
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        segmentedControl.selectedSegmentIndex = TripType.Flight.rawValue
        
        RequestManager.data(type: TripType.Flight, orderBy: orderType, completionHandler: { (data) in
            self.dataArray = data
        })
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        RequestManager.data(type: TripType(rawValue: sender.selectedSegmentIndex)!, orderBy: orderType, completionHandler: { (data) in
            self.dataArray = data
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationNavVC = segue.destination as? UINavigationController, let destinationVC = destinationNavVC.viewControllers.first as? OrderByTableViewController, segue.identifier == segueIdentifier {
            destinationVC.orderType = orderType
            destinationVC.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as! TripTableViewCell
        cell.logo.sd_setImage(with: dataArray[indexPath.row].logo)
        cell.departureLabel.text = "departure: \(dataArray[indexPath.row].departure)"
        cell.arrivalLabel.text = "arrival: \(dataArray[indexPath.row].arrival)"
        cell.changesLabel.text = "changes: \(dataArray[indexPath.row].numberOfStops)"
        cell.durationLabel.text = dataArray[indexPath.row].duration
        cell.priceLabel.text = "\(dataArray[indexPath.row].price) Euros"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController: OrderByDelegate {
    func orderChanged(type: OrderType) {
        orderType = type
        dataArray = Trip.sortBy(data: dataArray, type: type)
    }
}

