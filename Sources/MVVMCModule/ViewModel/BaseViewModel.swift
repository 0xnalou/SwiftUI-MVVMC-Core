//
//  BaseViewModel.swift
//
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import Combine
import SwiftUI

public protocol BaseViewModel: ObservableObject {
    associatedtype State
    associatedtype Action
    
    var state: State { get }
    var action: Action { get }
}

// MARK: CommonState
public struct CommonState {
    public var onStartLoading: AnyPublisher<Bool, Never>
    public var toastPublisher: AnyPublisher<Toast, Never>
    public var popPublisher: AnyPublisher<Void, Never>
    public var popToRootPublisher: AnyPublisher<Void, Never>
    public var dismissPublisher: AnyPublisher<Void, Never>
}

// MARK: CommonAction
public protocol CommonAction {
    
    // MARK: View LifeCycle
    func onViewAppear()
    func onViewDisappear()
    
    // MARK: Navigation
    func dismiss()
    func pop()
    func popToRoot()
}
