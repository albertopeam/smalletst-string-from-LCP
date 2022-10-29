import Foundation

private let impossible = "Impossible"
private let englishAlphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

/// computes the alphabetic smallest string that conforms to the lcp array
public func findTheString(_ lcp: [[Int]]) -> String {
    if lcp.isEmpty {
        return impossible
    }
    
    let size = lcp.count
    if lcp.contains(where: { $0.count != size }) {
        return impossible
    }
    
    guard let max = lcp.flatMap({ $0 }).max(), max > 0 else {
        return impossible
    }
    
    var word = (0..<max).compactMap({ _ in englishAlphabet[0] })
    for (i, data) in lcp.enumerated() {
        for (j, value) in data.enumerated() {
            let a = word[word.index(after: i)...].joined()
            let b = word[word.index(after: j)...].joined()
            let lcp = a.longestCommonPrefix(b)
            if lcp.count != word.count {
                //TODO: +1 to the word using the j prefix:
                    //TODO: pick j index in the word and extract it
                    //TODO: find the word in the alphabet and pick the next one. edge case is 'z'???
                    //TODO: replace the word and continue                
            }
        }
    }
    
    return impossible
}
