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
        for (j, expectedLcpCount) in data.enumerated() {
            var solution: Bool = false
            var offset: Int = 0
            let defaultCharacter = word[j]
            while !solution {
                let currentCharacter = word[j+offset]
                let iTilFinishWord = word[i...].joined()
                let jTilFinishWord = word[j...].joined()
                let currentLcp = iTilFinishWord.longestCommonPrefix(jTilFinishWord)
                let currentLcpCount = currentLcp.count
                if currentLcpCount != expectedLcpCount {
                    if let nextAlphabetCharacter = englishAlphabet.drop(while: { $0 != currentCharacter }).dropFirst().first {
                        word[j+offset] = nextAlphabetCharacter
                    } else if j+offset < word.count-1 {
                        word[j] = defaultCharacter
                        offset += 1
                    } else {
                        return impossible
                    }
                } else {
                    solution = true
                }
            }
        }
    }
    return word.joined()
}
