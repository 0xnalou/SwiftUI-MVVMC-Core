//
//  File.swift
//  
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import SwiftUI

@MainActor
public final class NavigationController: ObservableObject {
    //MARK: - Public Property
    @Published public var navigationPath: NavigationPath = NavigationPath()
    
    //MARK: - Public Functions
    public init(navigationPath: NavigationPath = NavigationPath()) {
        self.navigationPath = navigationPath
    }
    
    public func push(to destination: any Hashable) {
        navigationPath.append(destination)
    }
    
    public func pop() {
        guard !navigationPath.isEmpty else {
            print("navigationPath is empty !!!")
            return
        }
        navigationPath.removeLast()
    }
    
    public func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
