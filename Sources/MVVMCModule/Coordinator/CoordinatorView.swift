//
//  CoordinatorView.swift
//
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import SwiftUI

public struct CoordinatorView<C: Coordinator>: View {
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) private var dismiss
    @StateObject private var coordinator: C

    public init(_ coordinator: C) {
        self._coordinator = StateObject(wrappedValue: coordinator)
    }

    public var body: some View {
        coordinator
            .start()
            .sheet(for: $coordinator.sheetPath)
            .onReceive(coordinator.dismiss) {
                dismiss()
            }
    }
}

