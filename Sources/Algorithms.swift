//
//  Algorithms.swift
//  SwiftMath
//
//  Global functions (public in internal) defined by SwiftMath module.
//  (c) 2016 Hooman Mehr. Licensed under Apache License v2.0 with Runtime Library Exception
//



/// Returns the Greatest Common Divisor (GCD) of two non-negative integers
///
/// For convenience, assumes gcd(0,0) == 0
/// Implemented using "binary GCD algorithm" (aka Stein's algorithm)
///
/// - Precondition: `a >= 0 && b >= 0`

public func gcd(_ a: Int, _ b: Int) -> Int {
    
    assert(a >= 0 && b >= 0)
    
    // Assuming gcd(0,0)=0:
    guard a != 0 else { return b }
    guard b != 0 else { return a }
    
    var a = a, b = b, n = Int()
    
    //FIXME: Shift loops are slow and should be opimized.
    
    // Remove the largest 2ⁿ from them:
    while (a | b) & 1 == 0 { a >>= 1; b >>= 1; n += 1 }
    
    // Reduce `a` to odd value:
    while a & 1 == 0 { a >>= 1 }
    
    repeat {
        
        // Reduce `b` to odd value
        while b & 1 == 0 { b >>= 1 }
        
        // Both `a` & `b` are odd here (or zero maybe?)
        
        // Make sure `b` is greater
        if a > b { swap(&a, &b) }
        
        // Subtract smaller odd `a` from the bigger odd `b`,
        // which always gives a positive even number (or zero)
        b -= a
        
        // keep repeating this, until `b` reaches zero
    } while b != 0
    
    return a << n // 2ⁿ×a
}



/// Returns the Greatest Common Divisor (GCD) of two unsigned integers
///
/// For convenience, assumes gcd(0,0) == 0
/// Implemented using "binary GCD algorithm" (aka Stein's algorithm)

public func gcd(_ a: UInt, _ b: UInt) -> UInt {
    
    // Assuming gcd(0,0)=0:
    guard a != 0 else { return b }
    guard b != 0 else { return a }
    
    var a = a, b = b, n = UInt()
    
    //FIXME: Shift loops are slow and should be opimized.
    
    // Remove the largest 2ⁿ from them:
    while (a | b) & 1 == 0 { a >>= 1; b >>= 1; n += 1 }
    
    // Reduce `a` to odd value:
    while a & 1 == 0 { a >>= 1 }
    
    repeat {
        
        // Reduce `b` to odd value
        while b & 1 == 0 { b >>= 1 }
        
        // Both `a` & `b` are odd here (or zero maybe?)
        
        // Make sure `b` is greater
        if a > b { swap(&a, &b) }
        
        // Subtract smaller odd `a` from the bigger odd `b`,
        // which always gives a positive even number (or zero)
        b -= a
        
        // keep repeating this, until `b` reaches zero
    } while b != 0
    
    return a << n // 2ⁿ×a
}
