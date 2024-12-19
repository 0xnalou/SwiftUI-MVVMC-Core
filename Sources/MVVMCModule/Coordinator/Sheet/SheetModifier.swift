//
//  File.swift
//  
//
//  Created by Nalou Nguyen on 16/12/24.
//

import Foundation
import SwiftUI

struct SheetModifier: ViewModifier {
    @Binding var sheetPath: SheetPath
    
    // This is where we store all our factories
    @State private var factories: [String: NavigationViewFactory] = [:]
    
    init(sheetPath: Binding<SheetPath>) {
        self._sheetPath = sheetPath
    }
    
    func body(content: Content) -> some View {
        content
        // Here the PreferenceKey will reduce all our factories passed up the view hierarchy and store them
            .onPreferenceChange(SheetFactoryKey.self) { item in
                factories = item
            }
        // Here we isolate the factory with the same Type as the current sheetPath.id which is based on the same data Type description
            .sheet(item: _sheetPath.sheet,
                   onDismiss: sheetPath.sheet?.onDismiss,
                   content: {
                print(sheetPath.id)
                print(factories[sheetPath.id])
                return factories[sheetPath.id]?.factory($0.sheet)
            }) // call the factory with the sheet data type instance injected
    }
}
