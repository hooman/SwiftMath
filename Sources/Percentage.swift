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

    
    /// Convert from a Double.
    ///
    /// Adds support for specifying tolerance as a percentage of value to Double to Rational conversion
    /// Initializer. It is otherwise identical to the similar Rational initializer with absolute tolerance
    /// value. The default tolerance is 0.01%
    ///
    /// You may pass a list of preferred denominators to try first before falling back to smallest
    /// denominator algoorithm.
    ///
    /// - Parameter x: A Double value to convert to rational.
    ///
    /// - Parameter tolerance: The maximum acceptable amount of error of the conversion. Defaults to
    ///   0.00005. A tolerance of 0.0 causes an exact conversion of binary floting point which
    ///   may itself be in error as a result of a previous convertion of a rational (such as decimal
    ///   fraction) to binary floating point.
    ///
    /// - Parameter preferredDenominators: An array of denominators to use for the rational in the
    ///   order of preference. The first denominator that produces a result within the tolerance
    ///   will be selected. Defaults to empty array [].
    ///
    /// - Precondition: 0.0 <= tolerance < 1.0
    
    public init(_ x: Double, tolerance: Percentage = Percentage(0.01), preferredDenominators: [Int] = [] ) {
        
        self.init(x, tolerance: abs(x)*tolerance, preferredDenominators: preferredDenominators)
    }

    /// Returns a rational that has the smallest possible denominator that does not exceed the specified tolerance.
    ///
    /// Note that tolerance is a relative percentage.

    public func rounded(withTolerance tolerance: Percentage) -> Rational {
        
        return rounded(withTolerance: abs(Double(self)) * tolerance )
    }
}


extension Scalable where ScaleFactor == Double {
    
    func scaled(by factor: Percentage) -> Self {
        
        return scaled(by: factor.value)
    }
}

