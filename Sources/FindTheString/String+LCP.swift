import Foundation

extension String {
    /// obtains the longest common prefix between self and the param
    func longestCommonPrefix(_ b: String) -> String {
        let min = min(count, b.count)
        let aPrefix = String(prefix(min))
        let bPrefix = String(b.prefix(min))
        var lcp = ""
        for index in aPrefix.indices {
            if aPrefix[aPrefix.startIndex...index] == bPrefix[bPrefix.startIndex...index] {
                lcp = lcp + aPrefix[index...index]
            } else {
                break
            }
        }
        return lcp
    }
}
