//
//  FeedbackItem.swift
//  Patient Feedback demo
//
//  Created by Andrew Porter on 3/5/22.
//

import Foundation
import SwiftUI

protocol ResponseType {
    associatedtype Response
    var options: [Response] { get set }
    var response: Response? { get set }
}

struct FeedbackItem<CustomContent: View> {
    var order: Int
    var response: (Int) -> Void
    let viewBuilder: () -> CustomContent
}
