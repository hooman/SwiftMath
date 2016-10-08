//
//  Utilities.swift
//  SwiftMath
//
//
//  Global functions (public in internal) defined by SwiftMath module.
//  (c) 2016 Hooman Mehr. Licensed under Apache License v2.0 with Runtime Library Exception
//



/// Utility protocol to help write more readable code.
///
/// One alternative is overloading multiplication / division operators, but it would
/// pollute operator space and lead to ambiguity.

internal protocol Scalable {
    
    
    /// The type of scale factor supporting by this scalable type.
    
    associatedtype ScaleFactor
    
    
    /// Returns a new item by scaling the current item to the given factor.
    ///
    /// - Parameter factor: The given scaling factor.
    
    func scaled(by factor: ScaleFactor) -> Self
}




extension Int: Scalable {
    
    typealias ScaleFactor = Double
    
    func scaled(by factor: Double) -> Int {
        
        return Int((Double(self) * factor).rounded())
    }
}




extension String {
    
    /// Returns a string with the given key characters replaced with corresponding value characters.
    ///
    /// - Parameter lookupTable: A dictionary that mapps character keys to character values. Each
    ///   character key in the string is replaced with the corresponding character value from this 
    ///   dictionary.
    
    func mapped(with lookupTable: [Character:Character]) -> String {
        
        return String(self.characters.map{ lookupTable[$0] ?? $0 })
    }
}
