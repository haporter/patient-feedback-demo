//
//  Name.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/4/22.
//

import Foundation

struct Name: Codable {
    let text: String?
    let family: String
    let given: [String]
}
