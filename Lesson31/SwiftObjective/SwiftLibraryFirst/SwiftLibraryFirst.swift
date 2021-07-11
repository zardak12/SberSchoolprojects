//
//  SwiftLibraryFirst.swift
//  SwiftLibraryFirst
//
//  Created by Марк Шнейдерман on 11.07.2021.
//
import Foundation
import SwiftLibrarySecond

open class SwiftLibraryFirst {
    
    public func multiplication(a: Int, b: Int) -> Int {
        return a * b
    }
    
    public func createLibrary() -> SwiftLibrarySecond {
        return SwiftLibrarySecond()
    }
    
    public init() {}
}
