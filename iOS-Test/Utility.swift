//
//  Utility.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit

class Utility: NSObject {

    static func convertDateStringToDateWithFormat(format: String, dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = format
        return formatter.date(from: dateString)
    }
}
