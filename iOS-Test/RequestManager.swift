//
//  RequestManager.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit
import Alamofire

class RequestManager: NSObject {
    
    static private let flightsURL = URL(string: "https://api.myjson.com/bins/w60i")!
    static private let trainsURL = URL(string: "https://api.myjson.com/bins/3zmcy")!
    static private let busesURL = URL(string: "https://api.myjson.com/bins/37yzm")!
    
    static private let urls = [0:flightsURL, 1:trainsURL, 2:busesURL]

    static func data(type: TripType, orderBy: OrderType, completionHandler: @escaping ([Trip]) -> Void) {
        Alamofire.request(urls[type.rawValue]!, method: .get, parameters: nil, headers: nil).responseJSON { (response) in
            if let value = response.result.value as? [[String:AnyObject]] {
                var trips = [Trip]()
                for object in value {
                    let trip = Trip(data: object)
                    trips.append(trip)
                }
                completionHandler(Trip.sortBy(data: trips, type: orderBy))
            }
        }
    }
}
