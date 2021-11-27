//
//  dateFormatter.swift
//  PupGo
//
//  Created by Yuchen Liu on 11/26/21.
//

import Foundation

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    formatter.locale = Locale(identifier: "en-US")
    formatter.dateStyle = .medium
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return formatter
}
