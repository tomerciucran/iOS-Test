//
//  Trip.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

struct Trip {
    //Default values set to supress compile error
    var id: Int = 0
    var logo: URL?
    var price: String = ""
    var departure: String = ""
    var departureDate: Date = Date()
    var arrival: String = ""
    var arrivalDate: Date = Date()
    var duration: String = ""
    var numberOfStops: Int = 0
    
    init(data: [String:AnyObject]) {
        if let id = data["id"] as? Int,
        let logo = data["provider_logo"] as? String,
        let departure = data["departure_time"] as? String,
        let arrival = data["arrival_time"] as? String,
            let numberOfStops = data["number_of_stops"] as? Int {
            
            self.id = id
            self.logo = URL(string: logo.replacingOccurrences(of: "{size}", with: "63"))
            
            //Added this because of inconsistency in jsons ("price_in_euros" type differs)
            if let price = data["price_in_euros"] as? String {
                self.price = price
            }
            if let price = data["price_in_euros"] as? Double {
                self.price = "\(price)"
            }
            
            self.departure = departure
            self.arrival = arrival
            self.numberOfStops = numberOfStops
            
            departureDate = Utility.convertDateStringToDateWithFormat(format: "HH:mm", dateString: departure)!
            arrivalDate = Utility.convertDateStringToDateWithFormat(format: "HH:mm", dateString: arrival)!
            
            duration = arrivalDate.offsetFrom(date: departureDate)
        } else {
            print("Trip model parsing error!")
        }
    }
    
    static func sortBy(data: [Trip], type: OrderType) -> [Trip] {
        switch type {
        case OrderType.Departure:
            return data.sorted { (one, two) -> Bool in
                one.departure > two.departure
            }
        case OrderType.Arrival:
            return data.sorted { (one, two) -> Bool in
                one.arrival > two.arrival
            }
        case OrderType.Duration:
            return data.sorted { (one, two) -> Bool in
                one.arrivalDate.minutesFrom(date: one.departureDate) > two.arrivalDate.minutesFrom(date: two.departureDate)
            }
        }
    }
}
