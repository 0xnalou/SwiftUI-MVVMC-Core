//
//  SheetContainer.swift
//
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation

public class SheetContainer: Identifiable {
    public let id: String
    public let sheet: Any
    public let onDismiss: (() -> Void)?

    public init<T>(_ sheet: T,
                   onDismiss: (() -> Void)? = nil) where T: Identifiable  {
        // Use the data type we are working with as the identifier for the wrapper
        self.id = String(describing: T.self)
        self.sheet = sheet
        self.onDismiss = onDismiss
    }
}
