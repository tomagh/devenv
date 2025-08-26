// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

var stderrStream = StderrOutputStream()

do {
    let result = try CMD.xcodebuild.showBuildSettings()
    print(NormalizedBuildSettings(buildSttings: result))
} catch let error as LocalizedError {
    print("error: \(error.localizedDescription)", to: &stderrStream)
    if let reason = error.failureReason {
        print(reason, to: &stderrStream)
    }
} catch {
    print("error: \(error.localizedDescription)", to: &stderrStream)
}
