import XCTest
@testable import FindTheString

final class String_LCPTests: XCTestCase {
    func testGivenEmptyStringThenReturnEmpty() {
        let a = ""
        let b = "a"
        let result = a.longestCommonPrefix(b)
        XCTAssertEqual(result, "")
    }
    
    func testGivenNonEmptyStringWhenCompareToNotEmptyThenReturnEmpty() {
        let a = "a"
        let b = ""
        let result = a.longestCommonPrefix(b)
        XCTAssertEqual(result, "")
    }
    
    func testGivenNoCommonPrefixThenReturnEmpty() {
        let a = "aaa"
        let b = "ba"
        let result = a.longestCommonPrefix(b)
        XCTAssertEqual(result, "")
    }
    
    func testGivenTwoIdenticalStringsThenReturnTheSameString() {
        let a = "aaa"
        let result = a.longestCommonPrefix("aaa")
        XCTAssertEqual(result, a)
    }
    
    func testGivenOnlyOneCharacterCommonStringThenReturnOnlyThisCharacter() {
        let a = "aaa"
        let b = "aba"
        let result = a.longestCommonPrefix(b)
        XCTAssertEqual(result, "a")
    }
    
    func testGivenTwoCharactersCommonStringThenReturnTwoCharacter() {
        let a = "abb"
        let b = "aba"
        let result = a.longestCommonPrefix(b)
        XCTAssertEqual(result, "ab")
    }
    
    func testGivenTwoCharactersSuffixCommonStringThenReturnOnlyCommonPrefix() {
        let a = "cabb"
        let b = "cbbb"
        let result = a.longestCommonPrefix(b)
        XCTAssertEqual(result, "c")
    }
}
