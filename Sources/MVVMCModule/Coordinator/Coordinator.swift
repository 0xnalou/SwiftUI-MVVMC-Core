//
//  Coordinator.swift
//  
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import SwiftUI
import Combine

public protocol Coordinator: ObservableObject, Hashable, Identifiable {
    associatedtype V: View
    associatedtype D: Dependency
    
    var dependency: D { get }
    var navigationController: NavigationController { get set }
    var sheetPath: SheetPath { get set }
    var disposeBag: Set<AnyCancellable> { get }
    var dismiss: AnyPublisher<Void, Never> { get }
    
    @ViewBuilder @MainActor func start() -> V
    @MainActor func dismissSheet()
    func bindingViewModel()
}

// MARK: - NavigationController
extension Coordinator {
    @MainActor
    public func popToRoot() {
        navigationController.popToRoot()
    }
    
    @MainActor
    public func push<V>(_ value: V) where V : Hashable {
        navigationController.push(to: value)
    }
    
    @MainActor
    public func pop() {
        navigationController.pop()
    }
    
    @MainActor
    public func presentSheet<V>(_ value: V,
                                onDismiss: (() -> Void)? = nil)  where V: Identifiable & Hashable  {
        sheetPath.setSheet(value, onDismiss: onDismiss)
    }
}
