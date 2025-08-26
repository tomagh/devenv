import Foundation

func prettyJsonString(object: Encodable) -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
    if
        let jsonData = try? encoder.encode(object),
        let jsonString = String(data: jsonData, encoding: .utf8)
    {
        return jsonString
    } else {
        return "<invalid json>"
    }
}

extension String {
    func replaceXCConfig(value: String, with key: String) -> String? {
        let escapedValue = NSRegularExpression.escapedPattern(for: value)
        
        let pattern = "(?<=^| |:)\(escapedValue)"
        
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return self
        }
        
        let range = NSRange(self.startIndex..<self.endIndex, in: self)
        return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: key)
    }
}

struct StderrOutputStream: TextOutputStream {
    func write(_ string: String) {
        if let data = string.data(using: .utf8) {
            FileHandle.standardError.write(data)
        }
    }
}
