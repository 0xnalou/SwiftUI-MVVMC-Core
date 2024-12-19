//
//  SheetFactoryKey.swift
//
//
//  Created by Nalou Nguyen on 16/12/24.
//

import Foundation
import SwiftUI

struct SheetFactoryKey: PreferenceKey {
    static var defaultValue: [String: NavigationViewFactory] = [:]
    static func reduce(value: inout [String: NavigationViewFactory],
                              nextValue: () -> [String: NavigationViewFactory]) {
        value.merge(nextValue()) { $1 }
    }
}
