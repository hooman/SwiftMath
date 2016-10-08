import XCTest
@testable import SwiftMath

class SwiftMathTests: XCTestCase {
    
    var pairs: [(Int, Int)] = []
    var gcds: [Int] = []
    
    override func setUp() {
        
        super.setUp()
        
        let baseSize = 1025
        let sampleSize = (baseSize * (baseSize-1)) >> 1

        pairs.reserveCapacity(sampleSize)
        
        for i in 1...baseSize-1 { for j in i+1...baseSize { pairs.append((i,j)) } }
    }
    
    override func tearDown() {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testRationalNumber() {
        
        //FIXME: This test is a placeholder. Create a real test suit to cover the whole Rational API.
        
        let r = Rational(8, over: 16)
        
        XCTAssertEqual(r.numerator, 1)
        XCTAssertEqual(r.denominator, 2)
        XCTAssertEqual(r + r, 1)
        XCTAssertEqual(r * r, Rational(1, over: 4))
        
        let r2 = Rational(8, over: -16)
        
        XCTAssertEqual(r2.numerator, -1)
        XCTAssertEqual(r2.denominator, 2)
        XCTAssertEqual(r2, -r)
        XCTAssertEqual(abs(r2), r)
        XCTAssertEqual(r2.inverted(), -2)
        
        let r3 = (1.0/3.0)±0.0
        
        XCTAssertEqual(r3.rounded(withTolerance: 0.0001), Rational(1, over: 3))
    }
    
    
    //FIXME: Add tests for the rest of the API.
    
    
    func testCGDPerformance() {
        
        //FIXME: This test is a placeholder. Create a real test with better test data set. (A static random list?)

        gcds.reserveCapacity(pairs.count)
        
        self.measure { for (a,b) in self.pairs { self.gcds.append(gcd(a, b)) } } // 2.4M gcds/sec
    }


    static var allTests : [(String, (SwiftMathTests) -> () throws -> Void)] {
        return [
            ("testRationalNumber", testRationalNumber),
            ("testCGDPerformance", testCGDPerformance),
        ]
    }
}
