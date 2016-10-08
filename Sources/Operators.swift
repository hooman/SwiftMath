//
//  Operators.swift
//  SwiftMath
//
//  Custome operators and global operator overloads defined by SwiftMath module.
//  (c) 2016 Hooman Mehr. Licensed under Apache License v2.0 with Runtime Library Exception
//


/// Tolerance infix operator

infix operator ± : BitwiseShiftPrecedence



// (Double, XXX) -> Rational

public func ±(x: Double, tolerance: Double) -> Rational { return Rational(x, tolerance: tolerance) }
public func ±(x: Double, tolerance: Percentage) -> Rational { return Rational(x, tolerance: x*tolerance) }



// (Rational, XXX) -> Rational

public func ±(x: Rational, tolerance: Double) -> Rational { return x.rounded(withTolerance: tolerance) }
public func ±(x: Rational, tolerance: Rational) -> Rational { return x.rounded(withTolerance: Double(tolerance)) }
public func ±(x: Rational, tolerance: Percentage) -> Rational { return x.rounded(withTolerance: tolerance) }



/// Percentage postfix operator

postfix operator %



/// Converts a Double to a Percentage.

public postfix func %(lhs: Double) -> Percentage { return Percentage(lhs) }
public postfix func %(lhs: Int) -> Percentage { return Percentage(lhs) }



//MARK: Basic Math Operators

// (Double, Percentage) -> Double

public func +(lhs: Double, rhs: Percentage) -> Double { return lhs + lhs * rhs.value }
public func -(lhs: Double, rhs: Percentage) -> Double { return lhs - lhs * rhs.value }
public func *(lhs: Double, rhs: Percentage) -> Double { return lhs * rhs.value }
public func /(lhs: Double, rhs: Percentage) -> Double { return lhs / rhs.value }



// (Rationl, Int) -> Rational

public func +(lhs: Rational, rhs: Int) -> Rational { return lhs + Rational(rhs) }
public func -(lhs: Rational, rhs: Int) -> Rational { return lhs - Rational(rhs) }
public func *(lhs: Rational, rhs: Int) -> Rational { return lhs * Rational(rhs) }
public func /(lhs: Rational, rhs: Int) -> Rational { return lhs / Rational(rhs) }



// (Int, Rationl) -> Rational

public func +(lhs: Int, rhs: Rational) -> Rational { return Rational(lhs) + rhs }
public func -(lhs: Int, rhs: Rational) -> Rational { return Rational(lhs) - rhs }
public func *(lhs: Int, rhs: Rational) -> Rational { return Rational(lhs) * rhs }
public func /(lhs: Int, rhs: Rational) -> Rational { return Rational(lhs) / rhs }



// (Rationl, Double) -> Double

public func +(lhs: Rational, rhs: Double) -> Double { return Double(lhs) + rhs }
public func -(lhs: Rational, rhs: Double) -> Double { return Double(lhs) - rhs }
public func *(lhs: Rational, rhs: Double) -> Double { return Double(lhs) * rhs }
public func /(lhs: Rational, rhs: Double) -> Double { return Double(lhs) / rhs }



// (Double, Rationl) -> Double

public func +(lhs: Double, rhs: Rational) -> Double { return lhs + Double(rhs) }
public func -(lhs: Double, rhs: Rational) -> Double { return lhs - Double(rhs) }
public func *(lhs: Double, rhs: Rational) -> Double { return lhs * Double(rhs) }
public func /(lhs: Double, rhs: Rational) -> Double { return lhs / Double(rhs) }
