//
//  Dependency.swift
//
//
//  Created by Nalou Nguyen on 4/12/24.
//

import Foundation
import Swinject

open class Dependency {
    open var assembler: AssemblerProtocol
    open var resolver: Resolver {
        return assembler.resolver
    }
    
    public init(assembler: AssemblerProtocol = Assembler()) {
        self.assembler = assembler
        setup()
    }
    
    public init(parent: Dependency) {
        if let assembler = parent.assembler as? Assembler {
            self.assembler = Assembler(parentAssembler: assembler)
        } else {
            self.assembler = Assembler()
        }
        setup()
    }
    
    open func setup() {
        // Override by sub class
    }
    
    open func setupByAssembly(_ assembly: Assembly) {
        assembler.apply(assembly: assembly)
    }
    
    open func resolve<T>(_ type: T.Type) -> T {
        guard let instance = resolver.resolve(type)
            else { fatalError("cannot resolve \(type)") }
        return instance
    }
    
    open func resolve<T, Arg>(_ type: T.Type, argument: Arg) -> T {
        guard let instance = resolver.resolve(type, argument: argument)
            else { fatalError("cannot resolve \(type)") }
        return instance
    }
    
    open func resolve<T, Arg1, Arg2>(_ type: T.Type, argument1: Arg1, argument2: Arg2) -> T {
        guard let instance = resolver.resolve(type, arguments: argument1, argument2)
            else { fatalError("cannot resolve \(type)") }
        return instance
    }
    
    open func resolve<T, Arg1, Arg2>(_ type: T.Type, arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard let instance = resolver.resolve(type, arguments: arg1, arg2)
            else { fatalError("cannot resolve \(type)") }
        return instance
    }
}
