import XCTest
@testable import FindTheString

final class FindTheStringTests: XCTestCase {
    func testGivenEmptyLCPThenReturnImpossible() throws {
        let lcp: [[Int]] = []
        let result = findTheString(lcp)
        XCTAssertEqual(result, "Impossible")
    }
    
    func testGivenNonSquareLCPThenReturnImpossible() throws {
        let lcp = [
            [3, 0, 0]
        ]
        let result = findTheString(lcp)
        XCTAssertEqual(result, "Impossible")
    }
    
    func testGivenZeroLCPThenReturnImpossible() throws {
        let lcp = [
            [0, 0],
            [0, 0]
        ]
        let result = findTheString(lcp)
        XCTAssertEqual(result, "Impossible")
    }
    
    func testGivenValidLCPOfSize3ThenReturnSmallestStringOfSize3() throws {
        let lcp = [
            [3, 0, 0],
            [0, 2, 1],
            [0, 1, 1]
        ]
        let result = findTheString(lcp)
        XCTAssertEqual(result, "abb")
    }
    
    func testGivenValidLCPOfSize4ThenReturnSmallestStringOfSize4() throws {
        let lcp = [
            [4, 0, 2, 0],
            [0, 3, 0, 1],
            [2, 0, 2, 0],
            [0, 1, 0, 1],
        ]
        let result = findTheString(lcp)
        XCTAssertEqual(result, "abab")
    }
    
    func testGivenInvalidLCPOfSize3ThenReturnImpossible() throws {
        let lcp = [
            [3, 3, 1],
            [3, 2, 2],
            [1, 2, 1]
        ]
        let result = findTheString(lcp)
        XCTAssertEqual(result, "Impossible")
    }
}
