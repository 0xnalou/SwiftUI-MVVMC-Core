//
//  BaseViewModelImpl.swift
//
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import Combine

open class BaseViewModelImpl: ObservableObject, CommonAction {
    // MARK: - CommonState
    @Published public private(set) var commonState: CommonState
    
    // MARK: - CommonAction
    public var commonAction: CommonAction {
        return self
    }
    
    open func onViewDisappear() { }
    
    open func onViewAppear() { }
    
    public func showToast(_ toast: Toast) {
        toastPublisher.send(toast)
    }
    
    public func pop() {
        popSubject.send()
    }
    
    public func popToRoot() {
        popToRootSubject.send()
    }
    
    public func dismiss() {
        dismissSubject.send()
    }
    
    // MARK: - Properties
    public var disposeBag = Set<AnyCancellable>()
    public var onStartLoadingSubject = PassthroughSubject<Bool, Never>()
    private var toastPublisher = PassthroughSubject<Toast, Never>()
    private var popSubject = PassthroughSubject<Void, Never>()
    private var popToRootSubject = PassthroughSubject<Void, Never>()
    private var dismissSubject = PassthroughSubject<Void, Never>()
    
    public init() {
        self.commonState = CommonState(
            onStartLoading: onStartLoadingSubject.asDriver(),
            toastPublisher: toastPublisher.asDriver(),
            popPublisher: popSubject.asDriver(),
            popToRootPublisher: popToRootSubject.asDriver(),
            dismissPublisher: dismissSubject.asDriver()
        )
    }
}

