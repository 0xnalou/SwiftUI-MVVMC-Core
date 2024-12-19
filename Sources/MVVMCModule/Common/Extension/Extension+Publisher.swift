//
//  Extension+Publisher.swift
//
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import Combine

public extension Publisher {
    func asDriver() -> AnyPublisher<Output, Never> {
        self
            .receive(on: DispatchQueue.main)
            .catch { _ in Empty<Output, Never>() }
            .share()
            .eraseToAnyPublisher()
    }
}
