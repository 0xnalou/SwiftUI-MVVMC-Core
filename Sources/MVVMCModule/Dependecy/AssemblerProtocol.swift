//
//  AssemblerProtocol.swift
//
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Swinject

public protocol AssemblerProtocol: AnyObject {
    var resolver: Resolver { get }
    func apply(assembly: Assembly)
    func apply(assemblies: [Assembly])
}

// MARK: - Assembler
extension Assembler: AssemblerProtocol {}
