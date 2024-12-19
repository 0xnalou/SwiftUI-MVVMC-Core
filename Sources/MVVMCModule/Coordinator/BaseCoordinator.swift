//
//  BaseCoordinator.swift
//  
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import SwiftUI
import Combine

open class BaseCoordinator<D: Dependency, VM: BaseViewModelImpl>: Hashable, Identifiable, ObservableObject {
    
    //MARK: - Public Property
    @ObservedObject public var navigationController: NavigationController
    @Published public var sheetPath: SheetPath = .init()
    public var identifier = UUID()
    public var dependency: D
    public let viewModel: VM
    public var disposeBag = Set<AnyCancellable>()
    public var dismiss: AnyPublisher<Void, Never> {
        dismissSubject.asDriver()
    }
    
    //MARK: - Private Properties
    private let dismissSubject = PassthroughSubject<Void, Never>()
    
    //MARK: - Private Functions
    public init(navigationController: NavigationController,
                sheetPath: SheetPath = .init(),
                viewModel: VM,
                dependency: D) {
        self.dependency = dependency
        self.navigationController = navigationController
        self.sheetPath = sheetPath
        self.viewModel = viewModel
        bindingViewModel()
    }
    
    open func bindingViewModel() {
        navigationController.objectWillChange
            .sink { _ in
                self.objectWillChange.send()
            }
            .store(in: &disposeBag)
        
        viewModel.commonState.popPublisher.sink { [weak self] in
            self?.navigationController.pop()
        }
        .store(in: &disposeBag)
        
        viewModel.commonState.popToRootPublisher.sink { [weak self] in
            self?.navigationController.popToRoot()
        }
        .store(in: &disposeBag)
        
        viewModel.commonState.dismissPublisher.sink { [weak self] in
            self?.dismissSheet()
        }
        .store(in: &disposeBag)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: BaseCoordinator, rhs: BaseCoordinator) -> Bool {
        return lhs === rhs
    }
    
    @MainActor
    public func dismissSheet() {
        dismissSubject.send()
    }
}
