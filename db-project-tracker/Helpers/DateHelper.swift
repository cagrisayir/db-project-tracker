//
//  DateHelper.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 15.01.2024.
//

import Foundation

struct DateHelper {
    static func projectUpdateDate(inputDate: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: inputDate)
    }
}
