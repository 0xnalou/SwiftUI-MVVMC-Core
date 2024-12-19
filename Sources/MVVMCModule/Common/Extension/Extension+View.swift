//
//  File.swift
//  
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import SwiftUI

public extension View {
    func sheetDestination<D,C>(for data: D.Type, @ViewBuilder sheet: @escaping (D) -> C) -> some View where D: Identifiable & Hashable, C : View  {
        preference(key: SheetFactoryKey.self,
                   value: [String(describing: data): NavigationViewFactory(data, sheet)]) // <- Here we set the key to the data type's description! and pass our view factory
    }
    
    func sheet(for sheetPath: Binding<SheetPath>) -> some View {
        modifier(SheetModifier(sheetPath: sheetPath))
    }
}
