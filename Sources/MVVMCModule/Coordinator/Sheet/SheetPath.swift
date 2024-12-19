//
//  File.swift
//  
//
//  Created by Nalou Nguyen on 16/12/24.
//

import Foundation

public struct SheetPath: Identifiable {
    // Use the current sheet's id if it exists
    public var id: String {
        sheet?.id ?? UUID().uuidString
    }
    public var sheet: SheetContainer?
    public var previousSheet: SheetContainer?
    
    public init(
        previousSheet: SheetContainer? = nil,
        sheet: SheetContainer? = nil
    ) {
        self.sheet = sheet
        self.previousSheet = previousSheet
    }
    
    mutating func setSheet<T>(
        _ sheet: T,
        onDismiss: ( () -> Void)? = nil
    ) where T: Identifiable  {
        self.sheet = SheetContainer(
            sheet,
            onDismiss: onDismiss
        )
    }
}
