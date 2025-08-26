import Foundation

struct CMD {
    struct RunResult: LocalizedError {
        var stdoutData: Data
        var stderrData: Data
        var exitCode: Int
        
        var errorDescription: String? {
            "Program exited with code \(exitCode)."
        }
        
        var failureReason: String? {
            let err = String(data: stderrData, encoding: .utf8)
            return err?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    static func run(
        tool: String,
        dir: String?  = nil,
        arguments: [String] = []
    ) throws -> RunResult {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: tool)
        if let dir {
            process.currentDirectoryURL = URL(fileURLWithPath: dir)
        }
        process.arguments = arguments
                
        let stdoutPipe = Pipe()
        process.standardOutput = stdoutPipe
        let stderrPipe = Pipe()
        process.standardError = stderrPipe

        try process.run()
        process.waitUntilExit()
        
        return RunResult(
            stdoutData: stdoutPipe.fileHandleForReading.readDataToEndOfFile(),
            stderrData: stderrPipe.fileHandleForReading.readDataToEndOfFile(),
            exitCode: Int(process.terminationStatus)
        )
    }
}

