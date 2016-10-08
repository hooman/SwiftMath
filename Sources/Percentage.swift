//
//  Percentage.swift
//  SwiftMath
//
//  An encapsulation of percentage value to aid in interaction with infix operators.
//  (c) 2016 Hooman Mehr. Licensed under Apache License v2.0 with Runtime Library Exception
//



/// A representation of a ratio (percentage).
///
/// It is an ancapsulation of percentage to aid in interaction of ratios with infix operators.
/// It is used here to distinguish absolute vs relative tolerance. Overloads for infix 
/// operators can be defined to enable operations like: 20 + 10% (which will return 22)

public struct Percentage {
    
    let value: Double
    
    internal init(_ value: Int) { self.init(Double(value)) }
    
    internal init(_ value: Double) {
        
        precondition(value >= 0.0, "Negative percentage is undefined.")
        
        self.value = value / 100.0
    }
}



extension Rational {

    /// Returns a rational that has the smallest possible denominator that does not exceed the specified tolerance.
    ///
    /// Note that tolerance is a relative percentage.

    public func rounded(withTolerance tolerance: Percentage) -> Rational {
        
        return rounded(withTolerance: Double(self) * tolerance )
    }
}


extension Scalable where ScaleFactor == Double {
    
    func scaled(by factor: Percentage) -> Self {
        
        return scaled(by: factor.value)
    }
}

