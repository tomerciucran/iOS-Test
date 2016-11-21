//
//  OrderByTableViewController.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit

class OrderByTableViewController: UITableViewController {
    
    var delegate: OrderByDelegate?
    var orderType: OrderType!
    private let reuseIdentifier = "OrderByTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearsSelectionOnViewWillAppear = false
        tableView.selectRow(at: IndexPath(row: orderType.rawValue, section: 0), animated: false, scrollPosition: .none)
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        delegate?.orderChanged(type: orderType)
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderTypeNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        cell.textLabel?.text = orderTypeNames[indexPath.row]
        cell.isSelected = indexPath.row == orderType.rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        orderType = OrderType(rawValue: indexPath.row)
    }
}
