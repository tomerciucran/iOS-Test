//
//  OrderType.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

let orderTypeNames = ["departure", "arrival", "duration"]

enum OrderType: Int {
    case Departure
    case Arrival
    case Duration
}

